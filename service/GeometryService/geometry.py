
import math
import multiprocessing as mp
import spiceypy as sp

import dill

# http://stackoverflow.com/a/24673524
def run_dill_encoded(what):
    fun, args, kwds = dill.loads(what)
    return fun(*args, **kwds)

def apply_async(pool, fun, args, kwds):
    return pool.apply_async(run_dill_encoded, (dill.dumps((fun, args, kwds)),),)

from sortedcontainers import SortedDict

from spyne.model.fault import Fault
from spyne.error import ValidationError

from . import geometry_spice as gs

sp.stypes.errorformat = "{long}"

class GeometrySpiceError(Fault):
    __type_name__ = 'SpiceError'
    __namespace__ = 'swhv.service.geometry'

    def __init__(self, message):
        Fault.__init__(self,
                       faultcode='Client.SpiceError',
                       faultstring='SPICE Error: %r' % message)

def utc2tai(utc, utc_end, deltat):
    if utc_end is None:
        utc_end = utc

    if deltat is None:
        deltat = 86400

    if deltat <= 0:
        utc_end = utc
        deltat = 1

    try:
        tai_beg = sp.unitim(sp.utc2et(utc), 'et', 'tai')
        tai_end = sp.unitim(sp.utc2et(utc_end), 'et', 'tai')
    except sp.stypes.SpiceyError as ex:
        raise GeometrySpiceError(ex.value)

    tais = []
    while tai_beg <= tai_end and len(tais) < 1e6:
        tais.append(tai_beg)
        tai_beg += deltat

    return tais

def position_spice(xfunc, tais, **kwargs):
    res = {}
    try:
        for tai in tais:
            et = sp.unitim(tai, 'tai', 'et')
            pos = sp.spkezp(kwargs['target'], et, kwargs['ref'], kwargs['abcorr'], kwargs['observer'])[0]
            utc = sp.et2utc(et, 'isoc', 3)

            res[utc] = xfunc(pos)
    except sp.stypes.SpiceyError as ex:
        return ex.value
    else:
        return res

def state_spice(xfunc, tais, **kwargs):
    res = {}
    try:
        for tai in tais:
            et = sp.unitim(tai, 'tai', 'et')
            sta = sp.spkez(kwargs['target'], et, kwargs['ref'], kwargs['abcorr'], kwargs['observer'])[0]
            utc = sp.et2utc(et, 'isoc', 3)

            res[utc] = [xfunc(sta[0:3]), sta[3:6]]
    except sp.stypes.SpiceyError as ex:
        return ex.value
    else:
        return res

def xform_spice(xfunc, tais, **kwargs):
    res = {}
    try:
        for tai in tais:
            et = sp.unitim(tai, 'tai', 'et')
            mat = sp.pxform(kwargs['from_ref'], kwargs['to_ref'], et)
            utc = sp.et2utc(et, 'isoc', 3)

            res[utc] = xfunc(mat)
    except sp.stypes.SpiceyError as ex:
        return ex.value
    else:
        return res

def utc2scs_spice(tais, sc):
    res = {}
    try:
        scid = sp.bods2c(sc)
        for tai in tais:
            et = sp.unitim(tai, 'tai', 'et')
            obt = sp.sce2s(scid, et)
            utc = sp.et2utc(et, 'isoc', 3)

            res[utc] = obt
    except sp.stypes.SpiceyError as ex:
        raise GeometrySpiceError(ex.value)
    else:
        return res

def scs2utc_spice(scs, sc):
    res = {}
    try:
        scid = sp.bods2c(sc)
        et = sp.scs2e(scid, scs)
        utc = sp.et2utc(et, 'isoc', 3)

        res[scs] = utc
    except sp.stypes.SpiceyError as ex:
        raise GeometrySpiceError(ex.value)
    else:
        return res

nprocs = mp.cpu_count()
pool = mp.Pool(nprocs, gs.spice_init)
# init SPICE in main process
gs.spice_init()

def distribute_work(func_spice, xfunc, tais, **kwargs):
    # Each process will get 'chunksize' tais
    chunk = int(math.ceil(len(tais) / float(nprocs)))
    results = [apply_async(pool, func_spice, args=(xfunc, tais[chunk*i:chunk*(i + 1)],), kwds=kwargs) for i in range(nprocs)]

    # Collect all results into a single result dict
    res = SortedDict()
    for r in results:
        obj = r.get()
        if isinstance(obj, str):
            raise GeometrySpiceError(obj)

        res.update(obj)

    return [ {k:v} for k, v in res.items() ]

def wrap_result(res):
    return {'result':res}

def state_internal(func_spice, utc, utc_end, deltat, kind, observer, target, ref, abcorr):
    try:
        tgt = sp.bods2c(target)
        obs = sp.bods2c(observer)
    except sp.stypes.SpiceyError as ex:
        raise GeometrySpiceError(ex.value)

    if abcorr is None:
        abcorr = 'NONE'
    if kind is not None:
        kind = kind.lower()

    try:
        xfunc = _POSITION_KIND[kind]
    except KeyError:
        raise ValidationError(kind)

    kwargs = {'observer': obs,
              'target': tgt,
              'ref': ref,
              'abcorr': abcorr}

    tais = utc2tai(utc, utc_end, deltat)
    return wrap_result(distribute_work(func_spice, xfunc, tais, **kwargs))

def position(utc, utc_end, deltat, kind, observer, target, ref, abcorr):
    return state_internal(position_spice, utc, utc_end, deltat, kind, observer, target, ref, abcorr)

def state(   utc, utc_end, deltat, kind, observer, target, ref, abcorr):
    return state_internal(state_spice,    utc, utc_end, deltat, kind, observer, target, ref, abcorr)

def xform(utc, utc_end, deltat, kind, from_ref, to_ref):
    if kind is not None:
        kind = kind.lower()

    try:
        xfunc = _TRANSFORM_KIND[kind]
    except KeyError:
        raise ValidationError(kind)

    kwargs = {'from_ref': from_ref,
              'to_ref': to_ref}

    tais = utc2tai(utc, utc_end, deltat)
    return distribute_work(xform_spice, xfunc, tais, **kwargs)

def utc2scs(utc, utc_end, deltat, sc):
    tais = utc2tai(utc, utc_end, deltat)
    return utc2scs_spice(tais, sc)

def scs2utc(scs, sc):
    return scs2utc_spice(scs, sc)

_POSITION_KIND = {
    None         : lambda x: x,
    'rectangular': lambda x: x,
    'latitudinal': sp.reclat,
    'radec'      : sp.recrad,
    'spherical'  : sp.recsph,
    'cylindrical': sp.reccyl,
    'geodetic'   : lambda x: sp.recgeo(x, 6378.14, 0.0033536422844278)
}

_TRANSFORM_KIND = {
    None         : lambda x: x,
    'matrix'     : lambda x: x,
    'angle'      : lambda x: sp.m2eul(x, 3, 2, 1),
    'quaternion' : sp.m2q
}

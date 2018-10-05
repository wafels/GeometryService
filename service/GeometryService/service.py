
import logging
logging.basicConfig(level=logging.INFO)

from spyne.application import Application
from spyne.decorator import rpc
from spyne.service import Service
from spyne.model.primitive import AnyDict, Integer, Float, Unicode

from spyne.protocol.http import HttpRpc
from spyne.protocol.json import JsonDocument
from spyne.protocol.msgpack import MessagePackDocument

from spyne.util.wsgi_wrapper import WsgiMounter

#####

from . import geometry

class GeometryService(Service):
    @rpc(Unicode(min_occurs=1), Unicode(min_occurs=1), Unicode(min_occurs=1), Unicode(min_occurs=1),
         Unicode(min_occurs=0), Unicode(min_occurs=0), Unicode(min_occurs=0), Float(min_occurs=0),
         _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def position(ctx, utc, observer, target, ref, abcorr, kind, utc_end, deltat):
        return geometry.position(utc, utc_end, deltat, kind, observer, target, ref, abcorr)

    @rpc(Unicode(min_occurs=1), Unicode(min_occurs=1), Unicode(min_occurs=1), Unicode(min_occurs=1),
         Unicode(min_occurs=0), Unicode(min_occurs=0), Unicode(min_occurs=0), Float(min_occurs=0),
         _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def state(ctx, utc, observer, target, ref, abcorr, kind, utc_end, deltat):
        return geometry.state(utc, utc_end, deltat, kind, observer, target, ref, abcorr)

    @rpc(Unicode(min_occurs=1), Unicode(min_occurs=1), Unicode(min_occurs=1),
        Unicode(min_occurs=0), Unicode(min_occurs=0), Float(min_occurs=0),
        _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def transform(ctx, utc, from_ref, to_ref, kind, utc_end, deltat):
        return geometry.xform(utc, utc_end, deltat, kind, from_ref, to_ref)

    @rpc(Unicode(min_occurs=1), Unicode(min_occurs=1),
         Unicode(min_occurs=0), Float(min_occurs=0),
        _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def utc2scs(ctx, utc, sc, utc_end, deltat):
        return geometry.utc2scs(utc, utc_end, deltat, sc)

    @rpc(Unicode(min_occurs=1), Unicode(min_occurs=1),
        _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def scs2utc(ctx, scs, sc):
        return geometry.scs2utc(scs, sc)

#####

def geometry_service(fcgi=True):
    if fcgi is False:
        def _on_method_return_object(ctx):
            ctx.transport.resp_headers['Access-Control-Allow-Origin'] = "*"
            ctx.transport.resp_headers['Cache-Control'] = "public,max-age=86400" # tbd

        GeometryService.event_manager.add_listener('method_return_object',
                                                   _on_method_return_object)

    tns = 'swhv.service.geometry'

    json = Application([GeometryService], tns=tns,
                       in_protocol=HttpRpc(validator='soft'),
                       out_protocol=JsonDocument())

    msgpack = Application([GeometryService], tns=tns,
                          in_protocol=HttpRpc(validator='soft'),
                          out_protocol=MessagePackDocument())

    return WsgiMounter({ 'json' : json, 'msgpack' : msgpack })

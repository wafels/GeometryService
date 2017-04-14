
import logging
logging.basicConfig(level=logging.DEBUG)

from spyne.application import Application
from spyne.decorator import rpc
from spyne.service import ServiceBase
from spyne.model.primitive import AnyDict, Integer, Float, String

from spyne.protocol.http import HttpRpc
from spyne.protocol.json import JsonDocument

from spyne.server.wsgi import WsgiApplication

#####

from . import geometry

class SolarSystemGeometryService(ServiceBase):
    @rpc(String, String, String, String,
         String(min_occurs=0), String(min_occurs=0), String(min_occurs=0), Float(min_occurs=0),
         _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def position(ctx, utc, observer, target, ref, abcorr, kind, utc_end, deltat):
        res = geometry.position(utc, utc_end, deltat, kind, observer, target, ref, abcorr)
        return res

    @rpc(String, String, String, String,
         String(min_occurs=0), String(min_occurs=0), String(min_occurs=0), Float(min_occurs=0),
         _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def state(ctx, utc, observer, target, ref, abcorr, kind, utc_end, deltat):
        res = geometry.state(utc, utc_end, deltat, kind, observer, target, ref, abcorr)
        return res

    @rpc(String, String, String,
        String(min_occurs=0), String(min_occurs=0), Float(min_occurs=0),
        _returns=AnyDict, _throws=geometry.GeometrySpiceError)
    def transform(ctx, utc, from_ref, to_ref, kind, utc_end, deltat):
        res = geometry.xform(utc, utc_end, deltat, kind, from_ref, to_ref)
        return res

#####

def geometry_service(fcgi=True):
    if fcgi is False:
        def _on_method_return_object(ctx):
            ctx.transport.resp_headers['Access-Control-Allow-Origin'] = "*"

        SolarSystemGeometryService.event_manager.add_listener('method_return_object',
                                                              _on_method_return_object)

    app = Application([SolarSystemGeometryService],
                      tns='sidc.service.geometry',
                      in_protocol=HttpRpc(validator='soft'),
                      out_protocol=JsonDocument())

    return WsgiApplication(app)

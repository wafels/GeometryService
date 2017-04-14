#!/usr/bin/env python

from flup.server.fcgi_fork import WSGIServer
from geometry import service

WSGIServer(service.geometry_service()).run()

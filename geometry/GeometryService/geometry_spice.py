
import os
import spiceypy as sp

def _furnish(directory, kernel):
    name = os.path.join(directory, kernel)
    sp.unload(name)

    if not kernel.startswith("-"):
        sp.furnsh(name)

def spice_init():
    sp.erract("set", 10, "return")
    sp.errdev("set", 10, "null")
    sp.trcoff();
    _furnish("/geometry/data/generic", "meta.ker")

    for r,d,f in os.walk("/geometry/data/kernels"):
        for files in f:
            _furnish(r, files)

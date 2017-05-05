import sys,site

try:
    lib_path = site.getsitepackages()[0]
except AttributeError: # virtualenv
    from distutils.sysconfig import get_python_lib
    lib_path = get_python_lib()

sys.stdout.write(lib_path)

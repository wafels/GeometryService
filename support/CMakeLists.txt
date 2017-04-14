project(SIDC_support C)

set(CMAKE_C_FLAGS_RELWITHDEBINFO "${CMAKE_C_FLAGS_RELWITHDEBINFO} -O3 -mssse3")

set(SIDC_SUPPORT        ${CMAKE_INSTALL_PREFIX}/support)
set(SIDC_SUPPORT_INC    ${SIDC_SUPPORT}/include)
set(SIDC_SUPPORT_LIB    ${SIDC_SUPPORT}/lib)

set(BUILD_PYSPICE 1)

add_subdirectory(spice)

add_subdirectory(python)

include(ExternalProject)

macro(sidc_install_lib_external target source md5)
    ExternalProject_Add(${target}_external
        URL               ${CMAKE_CURRENT_SOURCE_DIR}/cache/${source}
        URL_MD5           ${md5}
        CONFIGURE_COMMAND <SOURCE_DIR>/configure --enable-shared --disable-static --prefix=<INSTALL_DIR>
        BUILD_COMMAND     make
        INSTALL_DIR       ${SIDC_SUPPORT}
        INSTALL_COMMAND   make install)

    add_library(${target} SHARED IMPORTED GLOBAL)
    set_property(TARGET ${target} PROPERTY
        IMPORTED_LOCATION "${SIDC_SUPPORT_LIB}/${CMAKE_SHARED_LIBRARY_PREFIX}${target}${CMAKE_SHARED_LIBRARY_SUFFIX}")
    add_dependencies(${target} ${target}_external)
endmacro()

macro(sidc_install_bin_external target source md5)
    ExternalProject_Add(${target}_external
        URL               ${CMAKE_CURRENT_SOURCE_DIR}/cache/${source}
        URL_MD5           ${md5}
        CONFIGURE_COMMAND <SOURCE_DIR>/configure --prefix=<INSTALL_DIR>
        BUILD_COMMAND     make
        BUILD_IN_SOURCE   1
        INSTALL_DIR       ${SIDC_SUPPORT}
        INSTALL_COMMAND   make install)

    add_executable(${target} IMPORTED GLOBAL)
    add_dependencies(${target} ${target}_external)
endmacro()

# http://www.fastcgi.com/dist/fcgi.tar.gz +
#--- fcgi-2.4.1-SNAP-0311112127/libfcgi/fcgio.cpp    2003-06-22 00:51:27.000000000 +0000
#+++ fcgi_external/libfcgi/fcgio.cpp 2014-12-22 11:03:03.898155694 +0000
#@@ -25,6 +25,8 @@
# #include <limits.h>
# #include "fcgio.h"

#+#include <cstdio>
#+
# using std::streambuf;
# using std::istream;
# using std::ostream;
sidc_install_lib_external(fcgi fcgi.tar.gz 8cc7b738d9da3daa991a7cb8d5399b29)

# http://download.lighttpd.net/spawn-fcgi/releases-1.6.x/spawn-fcgi-1.6.4.tar.bz2
sidc_install_lib_external(spawn-fcgi spawn-fcgi-1.6.4.tar.bz2 bf269849995ab8b3a8989779fa5818aa)
# http://nginx.org/download/nginx-1.7.8.tar.gz
sidc_install_bin_external(nginx nginx-1.7.8.tar.gz fd5ab813fc1853cd8efe580ead577c3e)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(LDFLAGS LDFLAGS=-Wl,--rpath=<INSTALL_DIR>/lib)
endif()

if(DEFINED ENV{PYTHON_OSX_OPENSSL_INCLUDE})
    set(PYTHON_BUILD_CFLAGS "CFLAGS=-I$ENV{PYTHON_OSX_OPENSSL_INCLUDE}")
endif()

ExternalProject_Add(python
    URL               ${CMAKE_CURRENT_SOURCE_DIR}/cache/Python-2.7.13.tgz
    URL_MD5           17add4bf0ad0ec2f08e0cae6d205c700
    CONFIGURE_COMMAND ${LDFLAGS} ${PYTHON_BUILD_CFLAGS} <SOURCE_DIR>/configure --enable-shared --with-ensurepip=install --prefix=<INSTALL_DIR>
    BUILD_COMMAND     make
    INSTALL_DIR       ${SIDC_INSTALL_PYTHON}
    INSTALL_COMMAND   make install)

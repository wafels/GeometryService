
if(BUILD_PYSPICE)

if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
    set(LDFLAGS LDFLAGS=-Wl,--rpath=${CMAKE_INSTALL_PREFIX}/lib)
endif()

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
            cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/PySPICE ${CMAKE_CURRENT_BINARY_DIR} &&
            C_INCLUDE_PATH=${SPICE}/include LIBRARY_PATH=${CMAKE_INSTALL_PREFIX}/lib ${LDFLAGS} ${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/PySPICE
    \")")

endif()

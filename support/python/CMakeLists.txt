
execute_process(COMMAND ${CMAKE_INSTALL_PREFIX}/python/bin/python -c "import sys,site; sys.stdout.write(site.getsitepackages()[0])" OUTPUT_VARIABLE py_pkgs)

# improve this
if(NOT CMAKE_VERSION VERSION_LESS 3.0) # i.e CMAKE_VERSION >= 3.0 for property location
    cmake_policy(SET CMP0026 OLD)
endif()

get_property(spice_lib TARGET spice PROPERTY LOCATION)
get_filename_component(spice_lib_name ${spice_lib} NAME)
set(spice_target_location ${SIDC_INSTALL_LIB}/${spice_lib_name})

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
                ${PIPI} six && ${PIPI} numpy
    \")")

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
                cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/SpiceyPy ${CMAKE_CURRENT_BINARY_DIR} &&
                ${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/SpiceyPy &&
                ln -sf ${spice_target_location} ${py_pkgs}/spiceypy/utils/spice.so
    \")")

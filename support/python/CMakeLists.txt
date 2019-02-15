
set(PYTHON_EXECUTABLE "${CMAKE_INSTALL_PREFIX}/python/bin/python")

if(NOT MAXIMAL)
macro(bootstrap target)
    set(SOURCE_DIR   ${CMAKE_CURRENT_SOURCE_DIR}/${target})
    set(PYTHON_BUILD ${CMAKE_CURRENT_BINARY_DIR}/${target}-build)
    set(OUTPUT       ${CMAKE_CURRENT_BINARY_DIR}/${target}-timestamp)

    add_custom_command(OUTPUT ${OUTPUT}
        COMMAND ${CMAKE_COMMAND} -E copy_directory ${SOURCE_DIR} ${PYTHON_BUILD}
        COMMAND ${CMAKE_COMMAND} -E chdir ${PYTHON_BUILD} python virtualenv.py ${SIDC_INSTALL_PYTHON}
        COMMAND ${CMAKE_COMMAND} -E touch ${OUTPUT}
        DEPENDS ${SOURCE_DIR}/virtualenv.py)
    add_custom_target(${target} ALL DEPENDS ${OUTPUT})
endmacro()

bootstrap(pypa-virtualenv-c9cf748)
endif(NOT MAXIMAL)

configure_file(install_spicey.sh ${CMAKE_CURRENT_BINARY_DIR}/install_spicey.sh)
install(CODE "execute_process(COMMAND ${CMAKE_CURRENT_BINARY_DIR}/install_spicey.sh)")

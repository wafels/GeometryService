
set(PYTHON_EXECUTABLE "${CMAKE_INSTALL_PREFIX}/python/bin/python")
configure_file(install_spicey.sh ${CMAKE_CURRENT_BINARY_DIR}/install_spicey.sh)

install(CODE "execute_process(COMMAND ${CMAKE_CURRENT_BINARY_DIR}/install_spicey.sh)")

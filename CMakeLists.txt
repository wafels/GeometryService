
project(SIDC_service_geometry C)
cmake_minimum_required(VERSION 2.8)

set(CMAKE_BUILD_TYPE RelWithDebInfo)
# always relink to avoid bugs in cmake 2.6
set(CMAKE_NO_BUILTIN_CHRPATH TRUE)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -pedantic -Wall -W -pipe -std=gnu99")

set(CMAKE_INSTALL_PREFIX "/geometry")

set(SIDC_INSTALL_LIB     ${CMAKE_INSTALL_PREFIX}/lib)
set(SIDC_INSTALL_DATA    ${CMAKE_INSTALL_PREFIX}/data)
set(SIDC_INSTALL_PYTHON  ${CMAKE_INSTALL_PREFIX}/python)
set(SIDC_INSTALL_SUPPORT ${CMAKE_INSTALL_PREFIX}/support)
set(CMAKE_INSTALL_RPATH ${SIDC_INSTALL_LIB})

set(SIDC_PROJECT_NAME ${CMAKE_PROJECT_NAME})

set(PIPI "${SIDC_INSTALL_PYTHON}/bin/pip install --upgrade")

macro(sidc_install_lib target)
    set_target_properties(${target} PROPERTIES VERSION 1.0 SOVERSION 1.0 INSTALL_NAME_DIR ${SIDC_INSTALL_LIB})
    install(TARGETS ${target} EXPORT ${SIDC_PROJECT_NAME} DESTINATION ${SIDC_INSTALL_LIB})
    install(EXPORT ${SIDC_PROJECT_NAME} DESTINATION ${SIDC_INSTALL_LIB})
endmacro()

macro(include_before ...)
    include_directories(BEFORE ${ARGV})
endmacro()

set(SUPPORT ${CMAKE_SOURCE_DIR}/support)
set(SPICE   ${SUPPORT}/spice/cspice-N65)

add_subdirectory(support)
add_subdirectory(data)

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
            cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/geometry ${CMAKE_CURRENT_BINARY_DIR} &&
            ${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/geometry
    \")")

set(GEOMETRY_FCGI_PORT 8080)
set(GEOMETRY_HTTP_PORT 7789)

configure_file(spawn_geometry_service ${CMAKE_CURRENT_BINARY_DIR}/spawn_geometry_service)
install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/spawn_geometry_service DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)

configure_file(nginx_geometry.conf ${CMAKE_CURRENT_BINARY_DIR}/nginx_geometry.conf)
install(FILES ${CMAKE_CURRENT_BINARY_DIR}/nginx_geometry.conf DESTINATION ${SIDC_INSTALL_SUPPORT}/conf)


set(PYTHON_EXECUTABLE ${SIDC_SUPPORT}/python/bin/python)

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
            ${PIPI} six && ${PIPI} lxml &&
            ${PIPI} spyne && ${PIPI} flup6 && ${PIPI} Werkzeug && ${PIPI} sortedcontainers
    \")")

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
            cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/dill ${CMAKE_CURRENT_BINARY_DIR} &&
            ${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/dill
    \")")

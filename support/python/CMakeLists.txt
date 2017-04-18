
install(CODE "execute_process(
    COMMAND /bin/sh -c \"
                ${PIPI} six && ${PIPI} numpy
    \")")

install(CODE "execute_process(
    COMMAND /bin/sh -c \"
                cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/SpiceyPy ${CMAKE_CURRENT_BINARY_DIR} &&
                ${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/SpiceyPy
    \")")

#!/bin/sh

${PIPI} six && ${PIPI} numpy &&
cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/SpiceyPy ${CMAKE_CURRENT_BINARY_DIR} &&
${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/SpiceyPy &&
ln -sf ${SIDC_INSTALL_LIB}/spice.so `${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_SOURCE_DIR}/find_sitepackages.py`/spiceypy/utils/

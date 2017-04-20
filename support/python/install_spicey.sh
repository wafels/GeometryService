#!/bin/sh

${PIPI} six && ${PIPI} numpy &&
cp -fpR ${CMAKE_CURRENT_SOURCE_DIR}/SpiceyPy ${CMAKE_CURRENT_BINARY_DIR} &&
${PIPI} ${CMAKE_CURRENT_BINARY_DIR}/SpiceyPy &&
ln -sf ${SIDC_INSTALL_LIB}/spice.so `${PYTHON_EXECUTABLE} -c "import sys,site; sys.stdout.write(site.getsitepackages()[0])"`/spiceypy/utils/

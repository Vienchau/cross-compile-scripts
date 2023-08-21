#!/bin/sh
export CROSS_PREFIX=""
export CC=${CROSS_PREFIX}gcc
export CXX=${CROSS_PREFIX}g+
export INSTALL_DIR=""

./configure --prefix=${INSTALL_DIR} --host=arm-linux 

make -j$(nproc)
make install
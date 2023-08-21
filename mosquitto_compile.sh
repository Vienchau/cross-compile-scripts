#!/bin/sh

### EDIT config.mk in src to change prefix, enable/disable option in needed
make clean
export CROSS_COMPILE=""
export CC=${CROSS_COMPILE}gcc
export CXX=${CROSS_COMPILE}g++
export prefix=""
export CPPFLAGS+="-I${prefix}/include"
export LDFLAGS+="-L${prefix}/lib"

make -j$(nproc)
make install
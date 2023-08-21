#!/bin/sh
make clean
export CROSS_COMPILE=""
export PREFIX=""

./Configure linux-aarch64 \
        shared \
        --prefix=$PREFIX \
        --openssldir=$PREFIX \
        --cross-compile-prefix=$CROSS_COMPILE \
        no-asm \
        no-async

make depend
make
make instal
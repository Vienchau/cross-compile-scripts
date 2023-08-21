#!/bin/sh
make clean

export CROSS_COMPILE=""
export PREFIX=""
export CPPFLAGS="-I${PREFIX}include"
export LDFLAGS="-L${PREFIX}lib"
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export LD=${CROSS_COMPILE}ld
export RANLIB=${CROSS_COMPILE}ranlib
export CC=${CROSS_COMPILE}gcc
export NM=${CROSS_COMPILE}nm

export LIBS="-lssl -lcrypto"

./configure  --prefix=${PREFIX} \
        --with-ssl=${PREFIX} \
        --without-zstd \
        --without-zlib \
        --host=aarch64-linux #change host to device's host

make 
make install
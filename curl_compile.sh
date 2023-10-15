#!/bin/sh
make clean
export CROSS_COMPILE=""
export CPPFLAGS="-I/root/workspace/resource/build/AC1000F/include"
export LDFLAGS="-L/root/workspace/resource/build/AC1000F/lib"
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export LD=${CROSS_COMPILE}ld
export RANLIB=${CROSS_COMPILE}ranlib
export CC=${CROSS_COMPILE}gcc
export NM=${CROSS_COMPILE}nm

export LIBS="-lssl -lcrypto"

./configure  --prefix=/root/workspace/resource/build/AC1000F \
        --with-openssl=/root/workspace/resource/build/AC1000F \
        --without-zstd \
        --without-zlib \
        --host=mips-linux
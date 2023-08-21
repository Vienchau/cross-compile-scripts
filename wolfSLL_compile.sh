#!/bin/bash
#wget http://curl.haxx.se/download/curl-7.37.1.tar.gz
#tar xzf curl-7.37.1.tar.gz
export PREFIX=""
export CROSS_COMPILE=""

export CFLAGS="-I${PREFIX}/include -DFP_MAX_BITS=8192"
export LDFLAGS="-L${PREFIX}/lib"
export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export LD=${CROSS_COMPILE}ld
export RANLIB=${CROSS_COMPILE}ranlib
export CC=${CROSS_COMPILE}gcc
export NM=${CROSS_COMPILE}nm
export C_EXTRA_FLAGS="-DFP_MAX_BITS=8192"

./configure --target=arm-buildroot-linux-uclibcgnueabi \
    --host=arm-buildroot-linux-uclibcgnueabi \
    --build=x86_64-pc-linux-gnu \
    --enable-tls13 \
    --enable-enckeys --prefix=${PREFIX} \
    --enable-sni \
    --enable-sslv3 \
    --enable-sha512 \
    --enable-oldtls \
    --enable-tlsv10 \
    --enable-ecc \
    --enable-supportedcurves \
    --enable-base64encode \
    C_EXTRA_FLAGS="-DFP_MAX_BITS=8192"

make -j$(nproc)
make -j$(nproc) install
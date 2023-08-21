#!/bin/sh
make clean
export PREFIX=""
export CROSS_COMPILE="/root/workspace/resource/toolchains/asdk-5.4.1-a53-EL-4.4-g2.23-a64nut-170801-r1/bin/aarch64-linux-gnu-"

export CPPFLAGS="-I${ROOTDIR}/include"
export LDFLAGS="-L${ROOTDIR}/lib"

export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export LD=${CROSS_COMPILE}ld
export RANLIB=${CROSS_COMPILE}ranlib
export CC=${CROSS_COMPILE}gcc
export NM=${CROSS_COMPILE}nm

./configure  --host=aarch64-linux  \
        --prefix=${PREFIX} \


make -j$(nproc) 

make install
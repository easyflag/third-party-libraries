#!/bin/bash
NDK_ROOT=/home/rainn/Android/Sdk/ndk/21.3.6528147
TOOLCHAIN=$NDK_ROOT/toolchains/llvm/prebuilt/linux-x86_64
TARGET=i686-linux-android
API=29
PLATFORM=$NDK_ROOT/platforms/android-29/arch-x86

export PATH=$PATH:$TOOLCHAIN/bin
export LDFLAGS="-L$PLATFORM/usr/lib"
export CFLAGS="-I$PLATFORM/usr/include -fPIC -mfloat-abi=softfp -mfpu=vfp -ffast-math -O2"

export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET$API-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET$API-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip
export NM=$TOOLCHAIN/bin/i686-linux-android-nm

rm -f Makefile
rm -rf build/$TARGET$API

./configure --host=i686-linux-android \
    --disable-shared \
    --disable-frontend \
    --enable-static \
    --prefix=$(pwd)/build/$TARGET$API

make clean
make -j6
make install

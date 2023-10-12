#!/bin/bash
rm -f Makefile
rm -rf build/local

./configure \
    --prefix=$(pwd)/build/local

make -j6
make install
make distclean

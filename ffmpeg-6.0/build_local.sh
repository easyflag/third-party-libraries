#!/bin/bash

<<configure_options
    # Standard options:
    --prefix=build/local \
    # Licensing options:
    --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    # Configuration options:
    --enable-shared \
    --enable-small \
    # Individual component options:
    --enable-filter=aresample \
    --enable-bsf=aac_adtstoasc \
    --enable-encoder=libfdk_aac \
    --enable-encoder=libx264 \
    --enable-decoder=mp3 \
    # External library support:
    --disable-securetransport \
    # The following libraries provide various hardware acceleration features:
    --disable-d3d11va \
    --disable-dxva2 \
    --disable-vaapi \
    --disable-vdpau \
    --disable-videotoolbox \
    # Optimization options (experts only):
    --disable-asm \
    # Toolchain options:
    --extra-cflags="-Ipc_fdk_aac/include -Ix264_pc/include -Ipc_lame/include" \
    --extra-ldflags="-Lpc_fdk_aac/lib -Lx264_pc/lib -Lpc_lame/lib"
configure_options

./configure \
    --prefix=build/local \
    \
    --enable-gpl \
    --enable-version3 \
    --enable-nonfree \
    \
    --enable-shared \
    --enable-small \
    \
    --enable-filter=aresample \
    --enable-bsf=aac_adtstoasc \
    --enable-encoder=libfdk_aac \
    --enable-encoder=libx264 \
    --enable-decoder=mp3 \
    \
    --disable-securetransport \
    \
    --disable-d3d11va \
    --disable-dxva2 \
    --disable-vaapi \
    --disable-vdpau \
    --disable-videotoolbox \
    \
    --disable-asm \
    \
    --extra-cflags="-Ipc_fdk_aac/include -Ix264_pc/include -Ipc_lame/include" \
    --extra-ldflags="-Lpc_fdk_aac/lib -Lx264_pc/lib -Lpc_lame/lib"

# --enable-libfdk_aac \
# --enable-libmp3lame \
# --enable-libx264 \

make -j6
make install
make distclean

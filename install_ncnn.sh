#!/usr/bin/env bash

brew install protobuf libomp cmake
# Pull repos
git clone https://github.com/Tencent/ncnn.git
cd ncnn
git submodule update --init
# Setup build
mkdir -p build && pushd build
cmake -DCMAKE_BUILD_TYPE=Release \
    -DNCNN_C_API=OFF \
    -DNCNN_RUNTIME_CPU=ON \
    -DNCNN_PYTHON=OFF \
    -DNCNN_OPENMP=OFF \
    -DNCNN_BENCHMARK=OFF \
    -DNCNN_VULKAN=OFF \
    -DNCNN_SYSTEM_GLSLANG=ON \
    -DNCNN_BUILD_EXAMPLES=OFF \
    -DNCNN_INSTALL_SDK=ON \
    -DNCNN_PIXEL=OFF \
    -DNCNN_PIXEL_ROTATE=OFF \
    -DNCNN_PIXEL_AFFINE=OFF \
    -DNCNN_PIXEL_DRAWING=OFF \
    -DNCNN_DISABLE_PIC=OFF \
    -DNCNN_BUILD_TESTS=OFF \
    -DNCNN_COVERAGE=OFF \
    -DNCNN_BUILD_BENCHMARK=ON \
    -DNCNN_INT8=OFF \
    -DNCNN_BF16=OFF \
    -DNCNN_FORCE_INLINE=ON \
    ..
# Build
make -j4
make install
popd

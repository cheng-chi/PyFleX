#!/bin/bash

export PATH_TO_PYFLEX=/home/cchi/dev/PyFleX
export PATH_TO_CONDA=/home/cchi/mambaforge

docker run \
    -v $PATH_TO_PYFLEX:/workspace/PyFleX \
    -v $PATH_TO_CONDA:/workspace/conda \
    -it chicheng/pyflex


# inside docker
export PATH="/workspace/conda/envs/pyflex/bin:$PATH"
cd /workspace/PyFleX
export PYFLEXROOT=${PWD}
export PYTHONPATH=${PYFLEXROOT}/bindings/build:$PYTHONPATH

# compile
cd bindings/
mkdir build; cd build; cmake ..; make -j

# change rpath and copy SDL library
patchelf --set-rpath '$ORIGIN' pyflex.cpython-38-x86_64-linux-gnu.so
cp ../../external/SDL2-2.0.4/lib/x64/libSDL2-2.0.so.0.4.0 ./libSDL2-2.0.so.0
chmod +x ./libSDL2-2.0.so.0

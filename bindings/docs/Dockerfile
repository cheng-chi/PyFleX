FROM nvidia/cuda:9.2-devel-ubuntu16.04

RUN apt update && apt install -y cmake build-essential libgl1-mesa-dev freeglut3-dev patchelf
RUN mkdir /workspace/ && cd /workspace/

WORKDIR /workspace

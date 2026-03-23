FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    openmpi-bin \
    libopenmpi-dev \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

WORKDIR /opt
RUN git clone https://github.com/CFDEMproject/LIGGGHTS-PUBLIC.git

WORKDIR /opt/LIGGGHTS-PUBLIC/src
RUN make auto

ENV PATH="/opt/LIGGGHTS-PUBLIC/src:${PATH}"

WORKDIR /work

# Set the base image to Ubuntu
FROM ubuntu:14.04

# Update the repository sources list
RUN apt-get update && apt-get install --yes \
    build-essential \
    gcc-multilib \
    apt-utils \
    zlib1g-dev \
    vim-common \
    git \
    g++ \
    python-pip \ 
    python-dev \ 
    libbz2-dev \
    libncurses-dev \
    libboost-math-dev \
    ibatlas-dev \
    liblapack-dev
    
WORKDIR /opt 
RUN git clone https://github.com/cgrlab/tvc.git

RUN tar -xvzf tvc-5.2.2.tar.gz

ENV PATH=$PATH:opt/tvc-5.2.2/bin

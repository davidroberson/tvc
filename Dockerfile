# Set the base image to Ubuntu
FROM ubuntu:14.04

WORKDIR /opt 

# Update the repository sources list
RUN apt-get update && apt-get install --yes \
    build-essential \
    gcc-multilib \
    apt-utils \
    zlib1g-dev \
    vim-common \
    git \
    g++ \
    cmake \
    python \ 
    python-dev \ 
    libbz2-dev \
    libncurses-dev \
    libboost-math-dev \
    wget \
    aptitude
 
 RUN aptitude install --yes \
    libatlas-dev \
    liblapack-dev

 RUN wget updates.iontorrent.com/tvc_standalone/tvc-5.2.2.tar.gz

# ENV PATH=$PATH:opt/tvc-5.2.2/bin

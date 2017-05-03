# Set the base image to Ubuntu
FROM ubuntu:14.04

# Update the repository sources list
RUN apt-get update && apt-get install --yes \
    build-essential \
    gcc-multilib \
    apt-utils \
    zlib1g-dev \
    vim-common \
    git

WORKDIR /opt 
RUN git clone https://github.com/cgrlab/tvc.git

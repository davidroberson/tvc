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
 
RUN aptitude install -y \
    libatlas-dev \
    liblapack-dev

RUN wget updates.iontorrent.com/tvc_standalone/tvc-5.2.2.tar.gz
 
RUN mkdir -p tvc_522_main/bin/

# 4. build armadillo
RUN wget http://updates.iontorrent.com/updates/software/external/armadillo-4.600.1.tar.gz && \
tar xvzf armadillo-4.600.1.tar.gz && \
cd armadillo-4.600.1/ && \
sed -i 's:^// #define ARMA_USE_LAPACK$:#define ARMA_USE_LAPACK:g' include/armadillo_bits/config.hpp && \
sed -i 's:^// #define ARMA_USE_BLAS$:#define ARMA_USE_BLAS:g'     include/armadillo_bits/config.hpp && \
cmake . && \
make -j4

# 5. build bamtools
RUN wget updates.iontorrent.com/updates/software/external/bamtools-2.4.0.20150702+git15eadb925f.tar.gz && \
tar xvzf bamtools-2.4.0.20150702+git15eadb925f.tar.gz && \
mkdir bamtools-2.4.0.20150702+git15eadb925f-build && \
cd bamtools-2.4.0.20150702+git15eadb925f-build && \
cmake ../bamtools-2.4.0.20150702+git15eadb925f -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo && \
make -j4


# 7. build htslib
RUN wget --no-check-certificate https://github.com/samtools/htslib/archive/1.2.1.tar.gz -O htslib-1.2.1.tar.gz && \
tar xvzf htslib-1.2.1.tar.gz && \
ln -s htslib-1.2.1 htslib && \
cd htslib-1.2.1 && \
make -j4


# 8. build samtools
RUN wget --no-check-certificate https://github.com/samtools/samtools/archive/1.2.tar.gz -O samtools-1.2.tar.gz && \
tar xvzf samtools-1.2.tar.gz && \
cd samtools-1.2 && \
make -j4 && \
cp samtools tvc_522_main/bin/





# ENV PATH=$PATH:opt/tvc-5.2.2/bin

FROM ubuntu@sha256:bffb6799d706144f263f4b91e1226745ffb5643ea0ea89c2f709208e8d70c999

LABEL org.opencontainers.image.licenses="GPL-2.0-or-later" \      
org.opencontainers.image.source="https://github.com/rocker-org/rocker-versioned2"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Etc/UTC

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get install -y \
    curl \
    build-essential \
    cmake \
    libboost-all-dev \
    zlib1g \
    zlibc \ 
    libc6 \
    gcc \
    g++ \
    tar

WORKDIR /apps

RUN curl -o cellranger-7.2.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.2.0.tar.gz?Expires=1697607156&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=NjqwU-WSckpj8YZ-pT56H5aA3lpqDwV7w-URYspZZu2joct4mN6VrVndD01hUbWpCfyKSIdwm88anlFLNVYR5FpCjL9ecj2l5FgOyV6tKYZJQg0v-dlScPP5NSpKcUgPCuQD0-2cq2keH3iy3946bAAONVsRqMDsNNv--BI0w3q2Pu5AK5gI4AGkh5zMmGPcKlX6alcWfoDLXot-QVsO5xXW-n~wDuDc-uUDKfxmyhDB80CuTVFs6L9YGmBm3iHULb8sz8gbdpeVu69MKEf26nIv~XgaiUWogQ~MDAwoMLgL5A8iTjavB3xAou2fLeegt7Nz-Ynuyd5bRVp7pAfNig__"


RUN tar -xvzf cellranger-7.2.0.tar.gz \
    && rm -rf cellranger-7.2.0.tar.gz

ENV PATH /apps/cellranger-7.2.0:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo 'export PATH="$PATH:/apps/cellranger-7.2.0"' >> /etc/bash.bashrc
#ENTRYPOINT ["cellranger"]
CMD ["bash","cellranger"]


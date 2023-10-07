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

RUN curl -o cellranger-7.2.0.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-7.2.0.tar.gz?Expires=1696649560&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=CqCzs1OFl997NA5zXHESzQvntZrLGx2eI1tI4UjKyxT9JeEFHeb1ThO8EtazFZydwUTsl48FbLypVnrXK4qqdiTAo1fXuKpKciP0YTBZcj04nrpqxHMcSz2QuRxS~N4uEg-lNx2DqWI4I67NgSye22FlwuA0RIzoBSxIOOCjdFfwiRtha74QiU-mvhNyGFUcVmvyCurION9Zna9kDDN4dqh~-XbHLgwcI8OEV-NMA9igZXnVA2y07-6i2uNLF5fPyCaNNcSG769NQpjWSamy3Ml4CVFVlv7gNg7vpoT-c61dtmNZ3B0gXjsaHHYbmJ8tMp-njWHi9z4ni6E-zI0G9Q__"


RUN tar xzf cellranger-7.2.0.tar.gz \
    && rm -rf cellranger-7.2.0.tar.gz

#ENV PATH /apps/cellranger-7.2.0:$PATH
RUN echo 'export PATH="$PATH:/apps/cellranger-7.2.0"' >> /etc/bash.bashrc
#ENTRYPOINT ["cellranger"]
CMD ["/bin/bash"]


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

RUN curl -o cellranger-8.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-8.0.1.tar.gz?Expires=1727943747&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=VuLr~kAIieK7INWg3EFmod0DOBkeNtjJUQONFBYRBa0bBAcppZ3-e~MBUT3Ist5QLCJk68hF7AYZa6nWcpvdS-PMh7YH~rVEnB5ublAZtBjoNYHvJtYlLuxpk7m2bJexB8nFP5Q~GxXbdigToqk2XTFAlEXFsVE~9rWfN3g6j0RUUzTYdytp2w~EFF8EidpD6o4ANuQapLwk0ZKbi1WAUZWVeCmtPVs4jCAiTbkCOyS61BY8igf3hXUcLEN2ReqjdLCVZXxQC5nlESczz-51t96AA02Kt2K~QX8cOVdApSOfsKjUnE~bc2Yl5NDU-gGTJN8DTTVkumicQSBlxk8YYA__"


RUN tar -xvzf cellranger-8.0.1.tar.gz \
    && rm -rf cellranger-8.0.1.tar.gz

ENV PATH /apps/cellranger-8.0.1:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo 'export PATH="$PATH:/apps/cellranger-8.0.1"' >> /etc/bash.bashrc
#ENTRYPOINT ["cellranger"]
CMD ["bash","cellranger"]
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

RUN curl -o cellranger-9.0.1.tar.gz "https://cf.10xgenomics.com/releases/cell-exp/cellranger-9.0.1.tar.gz?Expires=1746684330&Key-Pair-Id=APKAI7S6A5RYOXBWRPDA&Signature=LhCyUH06cJ1LZ6U08IaiXml3DgVg7Q9958qP4hidL0vuuDcA~Fftl0ycvBZomjJIbtAa5QIHQfNYzFDA7GIfYsAeRbeL53bvuMIO07Q1R4dKaTF~6nfefeanomAwv6S7oiOoYTCa7AGi9vixb38gL-H-TgwRz7VnWI4Ijw1f9Hfr7oBTCBOvAmnETvx3iJw5hwHXlqwyw9jGCeS1Yy7Z1fuR88F1UIrdnlQvZVws-lkbuxqh4plOCFdGnosQy~RE6uBwNMjbaAqqJvPxD~P9rSThkqJGQfEEY6JEQFaGuni941A1BCsxFDV~aYc0X3dZT4WHtcTxt7~JexXW7DgciQ__"


RUN tar -xvzf cellranger-9.0.1.tar.gz \
    && rm -rf cellranger-9.0.1.tar.gz

ENV PATH /apps/cellranger-9.0.1:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
RUN echo 'export PATH="$PATH:/apps/cellranger-9.0.1"' >> /etc/bash.bashrc
#ENTRYPOINT ["cellranger"]
CMD ["bash","cellranger"]
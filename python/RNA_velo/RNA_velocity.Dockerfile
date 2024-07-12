
FROM kalisaz/conda-utils:pip-conda

### Install samtools
RUN apt-get update -y && \
    apt-get install  -y --no-install-recommends autoconf \
    automake \
    make \
    gcc \
    perl \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    libncurses5-dev \
    libdeflate-dev \
    tar

RUN wget https://github.com/samtools/samtools/releases/download/1.20/samtools-1.20.tar.bz2 && \
    tar -xvjf samtools-1.20.tar.bz2 && \
    mkdir -p /opt/samtools/ && \
    cd samtools-1.20 && \
    ./configure --prefix=/opt/samtools/ && \
    make && \
    make install

RUN export PATH=/opt/samtools/bin:$PATH

### create a virtual environment for package installation
CMD ["/bin/bash"]
WORKDIR /app
# SHELL ["/bin/bash --login -c"]
COPY RNA_velo.yml .
# RUN /bin/bash --login -c conda env create -f requirement.txt
RUN conda env create -f RNA_velo.yml
# RUN /bin/bash --login -c conda init bash
RUN conda init
RUN conda run --no-capture-output -n RNA_velo
# SHELL ["conda run --no-capture-output -n RNA_velo /bin/bash -c"]
# ENTRYPOINT ["conda" "activate" "RNA_velo"]


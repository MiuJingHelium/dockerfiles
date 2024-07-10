# push to kalisaz/conda-utils
# Dockerfile for Ubuntu-based conda, pip, and python3.8
FROM ubuntu:mantic

ARG INSTALLER_VERSION=2024-.06-1
ENV PATH=/opt/conda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
CMD ["/bin/bash"]
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    apt-utils \
    wget \
    nano \
    vim \
	python3.8 \ 
    bzip2 \        
    ca-certificates \        
    git \
    libglib2.0-0 \
    libsm6 \
    libxext6 \
    libxrender1 \
    mercurial \
    openssh-client \
    procps \
    subversion  \  
    && rm -rf /var/lib/apt/lists/* # buildkit \
    && apt-get clean

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
RUN mkdir -p /opt \
    && bash miniconda.sh -b -p /opt/conda \
    && rm miniconda.sh
RUN ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh \
    && echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc \
    && echo "conda activate base" >> ~/.bashrc \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete \
    && /opt/conda/bin/conda clean -afy


    



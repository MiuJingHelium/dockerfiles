FROM rocker/verse:4.4.0

# Installing dependencies for Seurat
# Set global R options
RUN echo "options(repos = 'https://cloud.r-project.org')" > $(R --no-echo --no-save -e "cat(Sys.getenv('R_HOME'))")/etc/Rprofile.site
ENV RETICULATE_MINICONDA_ENABLED=FALSE

RUN apt-get update
RUN apt-get install -y \
    libhdf5-dev \
    libcurl4-openssl-dev \
    libssl-dev \
    libpng-dev \
    libboost-all-dev \
    libxml2-dev \
    openjdk-8-jdk \
    python3-dev \
    python3-pip \
    wget \
    git \
    libfftw3-dev \
    libgsl-dev \
    libgeos-dev

RUN apt-get install -y llvm-14

# Install bioconductor dependencies & suggests
RUN R --no-echo --no-restore --no-save -e "install.packages('BiocManager')"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('multtest', 'S4Vectors',  'BiocGenerics', 'GenomicRanges', 'IRanges', 'rtracklayer','Biobase'))"

# Install CRAN suggests
RUN R --no-echo --no-restore --no-save -e "install.packages(c('VGAM', 'R.utils', 'metap', 'Rfast2', 'ape', 'enrichR', 'mixtools','tidyverse'))"
RUN R --no-echo --no-restore --no-save -e "install.packages('remotes')"

# install EvoWeaver dependencies
RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('KEGGREST', 'SynExtend','org.Hs.eg.db','DECIPHER','AnnotationDbi','GenomeInfoDb'))"

CMD [ "R" ]
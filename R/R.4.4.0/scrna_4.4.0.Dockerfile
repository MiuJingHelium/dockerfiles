FROM kalisaz/seurat:r4.4.0

ARG R_REMOTES_UPGRADE="never"

# Install Harmony
# TODO use CRAN version of install
RUN R --no-echo --no-restore --no-save -e "remotes::install_github(c('immunogenomics/harmony','immunogenomics/presto'))"

# SCN migration tools
RUN R --no-echo --no-restore --no-save -e "remotes::install_github(repo='ctlab/SCNPrep', ref='dev')"


# Additional tools
# Somehow some packages need to be installed first...
RUN R --no-echo --no-restore --no-save -e "remotes::install_cran('caret')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_cran(c('caret', 'ggpubr', 'colorspace'))"
RUN R --no-echo --no-restore --no-save -e "remotes::install_version('scCustomize', version = '2.0.1', repos = 'http://cran.us.r-project.org')"
RUN R --no-echo --no-restore --no-save -e "remotes::install_cran(c('svglite', 'ggvenn', 'UpSetR', 'ggvenn', 'pheatmap', 'ggExtra', 'eulerr'))"
RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('scDataviz','fgsea'))"
RUN R --no-echo --no-restore --no-save -e "install.packages(c('shiny', 'WGCNA', 'stringr'))"



CMD [ "R" ]

FROM kalisaz/scrna:r4.4.0

ARG R_REMOTES_UPGRADE="never"

RUN R --no-echo --no-restore --no-save -e "install.packages(c('SoupX', 'WGCNA', 'WGCNA','DT','networkD3','RJSONIO','flexmix','msigdbr'))"

RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('miQC','DropletUtils','org.Mm.eg.db','EnhancedVolcano'))"

RUN R --no-echo --no-restore --no-save -e "remotes::install_github(c('chris-mcginnis-ucsf/DoubletFinder','immunogenomics/presto','satijalab/seurat-wrappers'))"

CMD [ "R" ]
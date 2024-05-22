FROM kalisaz/scrna:r4.4.0



# minpack.lm, ggrastr, reticulate

RUN R --no-echo --no-restore --no-save -e "install.packages(c('minpack.lm','ggrastr','reticulate','RColorBrewer','Cairo'))"

# rasterpdf

RUN R --no-echo --no-restore --no-save -e "devtools::install_github('ilarischeinin/rasterpdf')"


# FASTPG and RefPlus

RUN R --no-echo --no-restore --no-save -e "BiocManager::install('sararselitsky/FastPG','affy','affyPLM')"
RUN git clone https://git.bioconductor.org/packages/RefPlus \
    && R --no-echo --no-restore --no-save -e "install.packages('./RefPlus', repos = NULL, type='source')"


# Hotfix rastering

# TODO: can we fix the version and prevent it being updated?

# RUN R --no-echo --no-restore --no-save -e "devtools::install_version('scattermore', version = '1.2', repos = 'http://cran.us.r-project.org')"


#Add flowVS, flowCore, CATALYST

RUN R --no-echo --no-restore --no-save -e "BiocManager::install(c('flowCore','flowVS','CATALYST'))"




CMD [ "R" ]


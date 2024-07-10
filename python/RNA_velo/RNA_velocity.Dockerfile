
FROM kalisaz/conda-utils:pip-conda

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


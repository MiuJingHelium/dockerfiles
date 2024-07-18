FROM jupyter/datascience-notebook:ubuntu-20.04
# push to kalisaz/jupyternotebook:pyscenic

RUN conda install numpy pandas scanpy loompy pip -y && \
    pip install -U pyscenic && \
    pip install -U numpy==1.23.4

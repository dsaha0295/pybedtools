FROM ubuntu:18.04

WORKDIR /python_env
RUN apt-get update && apt-get install -y bzip2 wget libgl1-mesa-glx git && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda3

ENV PATH="$PATH:/python_env/miniconda3/bin/"


#Add Bioconda Channels
RUN conda config --add channels defaults && \
    conda config --add channels conda-forge && \
    conda config --add channels bioconda


RUN conda install -c bioconda bedtools
RUN conda install -y -c bioconda pandas==1.0.3 scipy==1.4.1 numpy==1.18.1 pybedtools==0.8.1 
RUN conda install -y biopython && conda update biopython


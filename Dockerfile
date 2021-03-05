#Ubuntu (Linux distrbution) as base for image
FROM ubuntu:18.04

#Set WD to something that is on default path
WORKDIR /usr/local/bin

#Install unix libraries and miniconda distribution
RUN apt-get update && apt-get install -y bzip2 wget libgl1-mesa-glx git && wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh  && \
    bash Miniconda3-latest-Linux-x86_64.sh -b -p miniconda3

#Add miniconda folder to path to recognize conda command
ENV PATH="$PATH:/usr/local/bin/miniconda3/bin/"

#Add Bioconda Channels
RUN conda config --add channels defaults && \
    conda config --add channels conda-forge && \
    conda config --add channels bioconda

#Install packages and update 
RUN conda install -c bioconda bedtools
RUN conda install -y -c bioconda pandas==1.0.3 scipy==1.4.1 numpy==1.18.1 pybedtools==0.8.1 
RUN conda install -y biopython && conda update biopython

#Create symlinks of all binary files back to working directory
RUN ln -s /usr/local/bin/miniconda3/bin/* /usr/local/bin

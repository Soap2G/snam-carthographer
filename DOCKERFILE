FROM jupyter/scipy-notebook:latest
WORKDIR /
ENV DEBIAN_FRONTEND=noninteractive
USER root

#install the prerequisites (option always yes activated)
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y python3 python3-dev git curl python3-pip \                                           
    && apt-get --yes install \
    dpkg-dev  \
    cmake \
    g++ \
    gcc \
    binutils\
    libx11-dev\
    libxpm-dev\
    libxft-dev\
    libxext-dev\
    libssl-dev\
    nano

RUN conda update \
jupyterlab \
notebook

#    ========================== 
#    Cloning repo for CGNN test
#   ========================== 

RUN cd /home/jovyan/work/ \
    git clone https://github.com/imayachita/Explore_GCN.git


WORKDIR /home/jovyan/work/

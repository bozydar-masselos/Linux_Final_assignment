FROM condaforge/mambaforge:latest
LABEL maintainer = "Theodoros Gionnas-Masselos" 
LABEL contact    = "theodoregionnas@gmail.com"
LABEL build_date = "2025-04-10"
LABEL version    = "v.0.0.1-dev"

# Set noninteractive installation
ENV DEBIAN_FRONTEND=noninteractive

# Install essential Ubuntu dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    libssl-dev \
    libxml2-dev \
    git \
    gzip \
    tar \
    wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create conda environment with defined dependencies
RUN mkdir -p /conda-envs/first_hndt
COPY envs/environment.yaml /conda-envs/first_hndt/environment.yaml

# Install dependencies using mamba
RUN mamba env create --prefix /conda-envs/first_hndt --file /conda-envs/first_hndt/environment.yaml && \
    mamba clean --all -y

# Add the environment path to PATH
ENV PATH /conda-envs/first_hndt/bin:$PATH

# Set the default shell and command
SHELL ["/bin/bash", "-c"]
CMD ["/bin/bash"]

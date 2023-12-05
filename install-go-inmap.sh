#!/bin/bash
set -e

export WRF_INSTALL=/shared
module use /shared/arm/modulefiles
module load acfl armpl
export OPENMPI_VERSION=4.1.5
export PATH=${WRF_INSTALL}/openmpi-${OPENMPI_VERSION}-acfl/bin:$PATH
export LD_LIBRARY_PATH=${WRF_INSTALL}/openmpi-${OPENMPI_VERSION}-acfl/lib:$LD_LIBRARY_PATH
export CC=armclang
export CXX=armclang++
export FC=armflang
export F77=armflang
export F90=armflang
export MPICC=mpicc
export MPIF77=mpifort
export MPIF90=mpifort
export MPICXX=mpicxx

# Install go
sudo apt-get update
wget https://go.dev/dl/go1.21.3.linux-arm64.tar.gz
sudo tar -xvf go1.21.3.linux-arm64.tar.gz
sudo mv go /usr/local
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH
source ~/.profile

go version

# Install inmap
cd /shared
git clone https://github.com/spatialmodel/inmap.git
cd inmap
GO111MODULE=on go build ./cmd/inmap

# Install inmap data version 1.6.1
wget https://zenodo.org/records/3403934/files/evaldata_v1.6.1.zip
unzip evaldata_v1.6.1.zip


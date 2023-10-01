#!/bin/bash
set -e

# download acfl for ubuntu 20.04 from arm website - https://developer.arm.com/downloads/-/arm-compiler-for-linux
# install acfl will include armpl automatically
mkdir -p /shared/tools
cd /shared/tools
wget -O arm-compiler-for-linux_23.04.1_Ubuntu-20.04_aarch64.tar 'https://developer.arm.com/-/media/Files/downloads/hpc/arm-compiler-for-linux/23-04-1/arm-compiler-for-linux_23.04.1_Ubuntu-20.04_aarch64.tar?rev=52971e8fa8a8498c834e48776dfd1ca5&revision=52971e8f-a8a8-498c-834e-48776dfd1ca5'
tar xf arm-compiler-for-linux_23.04.1_Ubuntu-20.04_aarch64.tar
sudo ./arm-compiler-for-linux_23.04.1_Ubuntu-20.04/arm-compiler-for-linux_23.04.1_Ubuntu-20.04.sh \
-i /shared/arm -a --force

module use /shared/arm/modulefiles
module load acfl
module load libfabric-aws/1.17.1 


#!/bin/bash
#SBATCH --job-name=InMAP
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=16
#SBATCH --time=120:00
#SBATCH --export=ALL
#SBATCH --exclusive

#ENV VARIABLES#

#---------------------Run-time env-----------------------------------------
#ulimit -s unlimited

#export OMP_STACKSIZE=12G
#export OMP_NUM_THREADS=8
#export FI_EFA_FORK_SAFE=1
#wrf_root=/shared
#wrf_install=${wrf_root}
#module use /shared/arm/modulefiles
#module load acfl armpl

#export PATH=${wrf_install}/openmpi-4.1.5-acfl/bin:$PATH
#export LD_LIBRARY_PATH=${wrf_install}/openmpi-4.1.5-acfl/lib:$LD_LIBRARY_PATH

#export LD_LIBRARY_PATH=${wrf_install}/netcdf-acfl/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=${wrf_install}/pnetcdf-acfl/lib:$LD_LIBRARY_PATH
#export LD_LIBRARY_PATH=${wrf_install}/hdf5-acfl/lib:$LD_LIBRARY_PATH

#--------------------------------------------------------------------------
#mkdir -p /shared/data-wrf && cd /shared/data-wrf
#wget https://www2.mmm.ucar.edu/wrf/src/conus12km.tar.gz
#tar xf conus12km.tar.gz
#cd conus12km
#cp ${wrf_install}/wrf-arm-v45-acfl/WRF/run/*.TBL .
#cp ${wrf_install}/wrf-arm-v45-acfl/WRF/run/*.formatted .
#cp ${wrf_install}/wrf-arm-v45-acfl/WRF/run/RRTMG* .
#cp ${wrf_install}/wrf-arm-v45-acfl/WRF/run/CAMtr_volume_mixing_ratio* .
#ln -s ${wrf_install}/wrf-arm-v45-acfl/WRF/main/wrf.exe wrf-v45-acfl.exe

echo "Running InMapF on $(date)"
echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope

#date -u +%Y-%m-%d_%H:%M:%S >> inmap.times

cd /shared/inmap/petro_test
srun /shared/inmap/inmap run steady --config=/shared/inmap/petro_test/belle_river_2023.toml 

#date -u +%Y-%m-%d_%H:%M:%S >> inmap.times

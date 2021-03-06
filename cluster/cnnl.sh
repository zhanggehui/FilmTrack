#!/bin/bash
#SBATCH -J G4
#SBATCH -p cn_nl
#SBATCH -N 1
#SBATCH -o ./1.out
#SBATCH -e ./2.err
#SBATCH --no-requeue
#SBATCH -A liufeng_g1
#SBATCH --qos=liufengcnnl
#SBATCH --exclusive

# environment variable:
# rundir, runscript

#1.out######################################################
hosts=`scontrol show hostname $SLURM_JOB_NODELIST`
echo "NodesList: $hosts"
echo "Number of Nodes: $SLURM_JOB_NUM_NODES"
echo "Cpus per Node: $SLURM_JOB_CPUS_PER_NODE" ; echo ''

#time.out###################################################
echo 'Begin at:' >> ./$rundir/time.out
date "+%Y-%m-%d %H:%M:%S"  >> ./$rundir/time.out
echo '' >> ./$rundir/time.out

#############################################################
source /home/liufeng_pkuhpc/lustre2/zgh/zgh_Geant4/geant4.sh
source ./$rundir/$runscript

###########################################################
echo 'End at:' >> ./$rundir/time.out
date "+%Y-%m-%d %H:%M:%S"  >> ./$rundir/time.out

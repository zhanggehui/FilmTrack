#!/bin/bash
#####  changable   ################################################
NodeType=cn-short # cn_nl; cn-short
NodeNum=1 # for spliting situations (future)
# run in build dir, always run in one node for no mpi works, only multi-thread
macfile='../FilmTrack.mac'
initfile='../run_init.mac'
scriptsdir='../cluster'
#rm -rf $rundir

##### environment variable #########################################
export runscript=$1
export rundir=$2
if [ ! -d $rundir ] ; then
    mkdir $rundir
    echo "Partition: $NodeType" > $rundir/time.out
    echo '' >> $rundir/time.out
##choose proper node setting ########################################
    if [ "$NodeType" == cn-short ] ; then
        submissionscript='cnshort.sh'
    elif [ "$NodeType" == cn_nl ] ; then
        submissionscript='cnnl.sh'
    fi
#####################################################################
    runtime=$(date "+%m%d-%H:%M")
    jobname="G4_$2_$runtime"  #format: G4_rundir_runtime
    keyword="#SBATCH -J" ; newline="#SBATCH -J $jobname"
    sed -i "/$keyword/c$newline" $scriptsdir/$submissionscript
    oname="./$rundir/1.out"
    keyword="#SBATCH -o" ; newline="#SBATCH -o $oname"
    sed -i "/$keyword/c$newline" $scriptsdir/$submissionscript
    ename="./$rundir/2.err"
    keyword="#SBATCH -e" ; newline="#SBATCH -e $ename"
    sed -i "/$keyword/c$newline" $scriptsdir/$submissionscript

    cp $scriptsdir/$runscript ./$rundir
    cp $scriptsdir/$submissionscript ./$rundir
    cp $macfile ./$rundir
    cp $initfile ./$rundir
    sbatch $scriptsdir/$submissionscript
else
    echo 'Already exists! Please make sure!'
fi

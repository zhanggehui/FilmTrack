#!/bin/bash

macfile="./$rundir/FilmTrack.mac"
initfile="./$rundir/run_init.mac"

for((i=0;i<1;i++))
do
    filename="${rundir}_$i"
    str1='setFileName'
    #or str1='\/analysis\/setFileName'
    str2="/analysis/setFileName $filename"
    sed -i "/$str1/c$str2" $macfile

    str1='execute'
    str2="/control/execute $initfile"
    sed -i "/$str1/c$str2" $macfile

    str1='stepMax'
    str2='/FilmTrack/stepMax 1 nm'
    sed -i "/$str1/c$str2" $initfile

    str1='numberOfThreads'
    str2="/run/numberOfThreads 20"
    sed -i "/$str1/c$str2" $initfile
    
    str1='beamOn'
    str2="/run/beamOn 1000"
    sed -i "/$str1/c$str2" $macfile

    ./FilmTrack $macfile && mv "$filename.root" ./$rundir
done

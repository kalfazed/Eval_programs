#!/bin/sh

#make clean

rm *.log

pes="1 2 4"
for pe in $pes
do
    mkdir ${pe}pe 
    cd ${pe}pe && echo "PE=${pe}\ninclude ../Makefile" > Makefile
    make clean
    make -j4 &
    lasttid=$!
#    make cout
    cd ..
done
    
wait $lasttid

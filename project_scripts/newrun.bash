#!/bin/bash
source /cvmfs/sft.cern.ch/lcg/releases/ROOT/6.14.04-fe6f8/x86_64-slc6-gcc7-opt/bin/thisroot.sh
source /cvmfs/sft.cern.ch/lcg/views/LCG_94/x86_64-slc6-gcc7-opt/setup.sh
source /cvmfs/sft.cern.ch/lcg/releases/Geant4/10.04.p02-fd180/x86_64-slc6-gcc7-opt/bin/geant4.sh

cd Simulation
mkdir build/runs
cp tchain.cxx build/runs
cp positions.txt build/runs
cp tfriends.cxx build/runs
cp textgenerator.py build/runs
cd build
cp LXe runs
cd runs


v=($(wc -l < positions.txt))

for (( c=1; c<$v; c++))
do
	python textgenerator.py $c
	mkdir run$c
	cp LXe run$c
	cp tchain.cxx run$c
	cp run.mac run$c
	cd run$c
	./LXe run.mac
	root -b -q tchain.cxx\($c,2\)
	cp "$c"out.root ..
	cd ..
	rm -rf run$c
	rm -rf run.mac
done
y=$v-1
root -b -q tfriends.cxx\($y\)

for (( c=1; c<$v; c++)) 
do
	rm -rf "$c"out.root
	
done

rm -rf tchain.cxx
rm -rf tfriends.cxx
rm -rf run.mac
rm -rf textgenerator.py
rm -rf positions.txt
rm -rf LXe

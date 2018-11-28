#!/bin/bash
source /home/chris/root/builddir/bin/thisroot.sh
source /home/chris/Documents/GEANT4/geant4.10.04-install/bin/geant4.sh

cd /home/chris/Documents/Project/Simulation
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
	rm -r run$c
	rm run.mac
done
y=$v-1
root -b -q tfriends.cxx\($y\)

for (( c=1; c<$v; c++)) 
do
	rm "$c"out.root
	
done

rm tchain.cxx
rm tfriends.cxx
rm run.mac
rm textgenerator.py
rm positions.txt
rm LXe

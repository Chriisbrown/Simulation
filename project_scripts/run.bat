cd C:\Users\chris\Documents\GitHub\project_simulation
copy run.mac build\Release
copy tchain.cxx build\Release
copy tfriends.cxx build\Release
cd build\Release
mkdir run1
copy  LXe.exe run1
copy tchain.cxx run1
cd run1
echo.> run.mac
echo /random/setSeeds 25 10 2018 10 10 >> run.mac
echo /gun/position 0 10 0 >> run.mac 
echo /LXe/rootname/number 1 >> run.mac
echo /run/beamOn 10 >> run.mac
LXe run.mac
root -b -q tchain.cxx(1)
copy 1out.root ..
cd ..
del /Q run1
mkdir run2
copy  LXe.exe run2
copy tchain.cxx run2
cd run2
echo.> run.mac
echo /random/setSeeds 25 10 2018 10 10 >> run.mac
echo /gun/position 0 10 1 >> run.mac 
echo /LXe/rootname/number 2 >> run.mac
echo /run/beamOn 10 >> run.mac
LXe run.mac
root -b -q tchain.cxx(2)
copy 2out.root ..
cd ..
del /Q run2
root -b -q tfriends.cxx(1)
del 1out.root
del 2out.root

del run.mac
del tchain.cxx
del tfriends.cxx



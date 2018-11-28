cd C:\Users\chris\Documents\GitHub\project_simulation
del build
mkdir build
cd build
cmake -DGeant4_DIR="C:\Users\chris\Documents\Documents\GEANT4\geant4_10_04-install\lib\Geant4-10.4.2" "C:\Users\chris\Documents\GitHub\project_simulation"
cmake --build . --config Release

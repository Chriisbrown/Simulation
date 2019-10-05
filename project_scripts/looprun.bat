cd C:\Users\chris\Documents\GitHub\project_simulation
copy tchain.cxx build\Release
copy positions.txt build\Release
copy tfriends.cxx build\Release
copy textgenerator.py build\Release
cd build\Release

for /f "usebackq" %%A in (`TYPE positions.txt ^| find /v /c "" `) do set v=%%A

FOR /L %%A IN (1,1,%v%) DO (
	python textgenerator.py %%A
	mkdir run%%A
	copy  LXe.exe run%%A
	copy tchain.cxx run%%A
	copy run.mac run%%A
	cd run%%A
	LXe run.mac
	cd ..
	del run.mac
	)

FOR /L %%A IN (1,1,%v%) DO (
	cd run%%A
	root -b -q tchain.cxx^(%%A^)
	copy %%Aout.root ..
	cd ..
	)

root -b -q tfriends.cxx(%v%)

FOR /L %%A IN (1,1,%v%) DO (
	del %%Aout.root
	del /Q run%%A
	)
del tchain.cxx
del tfriends.cxx
del run.mac
del textgenerator.py
del positions.txt






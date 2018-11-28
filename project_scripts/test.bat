cd C:\Users\chris\Documents\GitHub\project_simulation
for /f "usebackq" %%A in (`TYPE positions.txt ^| find /v /c "" `) do set v=%%A
echo %v%
FOR /L %%A IN (1,1,%v%) DO (
	set o=%%A
	set n=1
	set /a "s=%o%+%n%"
	echo %s%
	for /f "usebackq skip=%s% tokens=1-2 delims=," %%a in ("positions.txt") do (
		set a=%%a
		set b=%%b
	)
	echo %a%
	echo %b%
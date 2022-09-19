@ECHO OFF

REM get the name of the current location of the batch file
for %%I in (.) do set CurrDirNameFull=%%~fI

REM back out to the XML2-UltimatePatch folder
:dircheck
for %%I in (.) do set CurrDirName=%%~nxI
if not "%CurrDirName%"=="XML2-Ultimate-Patch" (
	cd ..
	goto dircheck
)

REM copy the .py file so it can be used
copy >nul "0. Utilities\cfgToPkgb.py" "%CurrDirNameFull%"

REM change back to the directory of the batch file
cd %CurrDirNameFull%

REM perform the cfg to pkgb conversion
for %%i in (*.cfg) do (
	echo %%~ni | python cfgToPkgb.py
)

REM clear the command prompt
cls

REM clean up by removing the python script
del >nul cfgToPkgb.py

REM ask where to move the packages
CHOICE /C YN /M "Are these character packages? "
IF ERRORLEVEL 2 goto ask
IF ERRORLEVEL 1 (
	REM character packages
	md "..\2. Default Assets - PC\packages\generated\characters"
	for %%x in (*.json) do move >nul "%%x" "..\2. Default Assets - PC\packages\generated\characters"
	goto end
)

:ask
REM non-character packages
set /p "endPath=Fill in where to put file: packages\generated\"
md "..\2. Default Assets - PC\packages\generated\%endPath%"
for %%x in (*.json) do move >nul "%%x" "..\2. Default Assets - PC\packages\generated\%endPath%"
goto end

:end
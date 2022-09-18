@ECHO OFF

for %%I in (.) do set CurrDirNameFull=%%~fI

:dircheck
for %%I in (.) do set CurrDirName=%%~nxI
if not "%CurrDirName%"=="XML2-Ultimate-Patch" (
	cd ..
	goto dircheck
)

copy >nul "0. Utilities\cfgToPkgb.py" "%CurrDirNameFull%"

echo DEBUG
pause

cd %CurrDirNameFull%

for %%i in (*.cfg) do (
	echo %%~ni | python cfgToPkgb.py
)

echo DEBUG 2
pause

del >nul cfgToPkgb.py

md "..\2. Default Assets - PC\packages\generated\characters"
for %%x in (*.json) do move >nul "%%x" "..\2. Default Assets - PC\packages\generated\characters"
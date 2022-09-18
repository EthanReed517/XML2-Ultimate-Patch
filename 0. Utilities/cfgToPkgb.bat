@ECHO OFF

for %%i in (*.cfg) do (
	echo %%~ni | python cfgToPkgb.py
)

md "..\2. Default Assets - PC\packages\generated\characters"
for %%x in (*.json) do move >nul "%%x" "..\2. Default Assets - PC\packages\generated\characters"
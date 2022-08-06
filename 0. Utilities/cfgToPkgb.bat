@ECHO OFF

for %%i in (*.cfg) do (
	echo %%~ni | python cfgToPkgb.py
)
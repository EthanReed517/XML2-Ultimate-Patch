@ECHO OFF

copy >nul "1. Base Assets\storm_0401.fb.cfg" .
copy >nul "1. Base Assets\storm_0401_nc.fb.cfg" .

copy >nul "..\..\0. Utilities\cfgCreate.py" .\

python cfgCreate.py

move >nul *.cfg "1. Base Assets"
del cfgCreate.py
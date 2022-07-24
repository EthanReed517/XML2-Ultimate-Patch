@ECHO OFF

copy >nul "1. Base Assets\magneto_2501.fb.cfg" .
copy >nul "1. Base Assets\magneto_2501_nc.fb.cfg" .

copy >nul "..\..\0. Utilities\cfgCreate.py" .\

python cfgCreate.py

move >nul *.cfg "1. Base Assets"
del cfgCreate.py
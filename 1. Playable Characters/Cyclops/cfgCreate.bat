@ECHO OFF

move >nul "1. Base Assets\cyclops_0101.fb.cfg" .
move >nul "1. Base Assets\cyclops_0101_nc.fb.cfg" .

python cfgCreate.py

move >nul *.cfg "1. Base Assets"
pause
ren *xbox *.cfg
move >nul *.cfg "2. Default Assets - Xbox"
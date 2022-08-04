@ECHO OFF

echo Building herostat files...
REM copy stuff to 1. Base Assets folder
copy >nul "..\..\0. Utilities\rosterBuild.py" "1. Base Assets"
copy >nul compile.ini "1. Base Assets"
copy >nul "..\..\0. Utilities\converter.py" "1. Base Assets"

REM move into the 1. Base Assets folder
cd "%~dp0\1. Base Assets"
REM clear out existing files
del *.json
REM rename the roster.cfg file and build it
ren rosterX2UP.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
REM rename files to correct values
ren "roster.cfg" "rosterX2UP.cfg"
ren "out.engb.json" "herostat.engb.json"
REM delete compilers and unecessary files
del "compile.ini"
del "converter.py"
del "out.engb.txt"
del "rosterBuild.py"
REM back out to main folder
cd ..
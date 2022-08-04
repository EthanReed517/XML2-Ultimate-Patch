@ECHO OFF

echo Building herostat files...
REM copy stuff to 1. Base Assets folder
md "0. Temp\0. Herostat Entries"
copy >nul "..\..\0. Utilities\rosterBuild.py" "0. Temp"
copy >nul compile.ini "0. Temp"
copy >nul "..\..\0. Utilities\converter.py" "0. Temp"

REM clear out existing herostat files
del >nul "1. Base Assets\herostat.engb.json"
del >nul "2. Default Assets - PC\herostat.engb.json"
del >nul "2. Default Assets - PC\heroreal.engb.json"
del >nul "2. Default Assets - PC\herosbro.engb.json"
del >nul "2. Default Assets - PSP\herostat.engb.json"

REM *******************
REM ***** Console *****
REM *******************
REM move files from 1. Base Assets
copy >nul "1. Base Assets\*.cfg" "0. Temp"
robocopy >nul "1. Base Assets\0. Herostat Entries" "0. Temp\0. Herostat Entries"
REM move into the 0. Temp folder
cd "%~dp0\0. Temp"
REM rename the roster.cfg file and build it
ren rosterX2UP.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
ren "out.engb.json" "herostat.engb.json"
REM delete unecessary files
del >nul out.engb.txt
del >nul roster.cfg
REM back out to main folder
cd ..
REM move the herostat to the appropriate place
move >nul "0. Temp\herostat.engb.json" "1. Base Assets"

REM **************
REM ***** PC *****
REM **************
REM move files from 2. Default Assets - PC
copy >nul "2. Default Assets - PC\*.cfg" "0. Temp"
REM move into the 0. Temp folder
cd "%~dp0\0. Temp"
REM *****X2UP*****
REM rename the roster.cfg file and build it
ren rosterX2UP.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
ren "out.engb.json" "herostat.engb.json"
REM delete unecessary files
del >nul out.engb.txt
del >nul roster.cfg
REM *****AXE*****
REM rename the roster.cfg file and build it
ren rosterAXE.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
ren "out.engb.json" "heroreal.engb.json"
REM delete unecessary files
del >nul out.engb.txt
del >nul roster.cfg
REM *****BHE*****
REM rename the roster.cfg file and build it
ren rosterBHE.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
ren "out.engb.json" "herosbro.engb.json"
REM delete unecessary files
del >nul out.engb.txt
del >nul roster.cfg
REM back out to main folder
cd ..
REM move the herostat to the appropriate place
move >nul "0. Temp\herostat.engb.json" "2. Default Assets - PC"
move >nul "0. Temp\heroreal.engb.json" "2. Default Assets - PC"
move >nul "0. Temp\herosbro.engb.json" "2. Default Assets - PC"

REM ***************
REM ***** PSP *****
REM ***************
REM move files from 1. Base Assets
copy >nul "2. Default Assets - PSP\*.cfg" "0. Temp"
REM move into the 0. Temp folder
cd "%~dp0\0. Temp"
REM rename the roster.cfg file and build it
ren rosterX2UP.cfg roster.cfg
python rosterBuild.py
REM convert to JSON
echo out.engb.txt | python converter.py
ren "out.engb.json" "herostat.engb.json"
REM delete unecessary files
del >nul out.engb.txt
del >nul roster.cfg
REM back out to main folder
cd ..
REM move the herostat to the appropriate place
move >nul "0. Temp\herostat.engb.json" "2. Default Assets - PSP"

REM remove the 0. Temp folder
rmdir /s /q "0. Temp"
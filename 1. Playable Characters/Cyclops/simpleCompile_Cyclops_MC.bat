@echo off
echo Compiling NPC - Cyclops_MC

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character's packages
set packageName=cyclops_mc_200
REM playable characters (and some NPCs) need the name of the xml packages listed as well
set xmlPackageName=""
REM define other values for the compiler
set effectsFolder=""
set powerstyle=""
set soundFile=""

REM ******************************
REM * Section 1 - Main Execution *
REM ******************************

REM create a folder where the files will go (if it's not already created)
md "0. Complete Files"
REM move into the folder where the cfg files are
cd "%~dp0\0. CFG Files\2. NPCs"
REM copy the cfg files out to the main folder
for /r %%x in (%packageName%*) do copy >nul "%%x" "..\.."
if not %xmlPackageName%=="" (
	copy >nul "%xmlPackageName%.fb.cfg" "..\.."
)
REM move back out to the main folder
cd ..\..
REM move the compilers into the main folder
copy >nul "0. Compilers\enter.vbs" "%~dp0"
copy >nul "0. Compilers\fbbuilder.bat" "%~dp0"
REM build the fb packages
call fbbuilder.bat
REM delete the cfg files from the main folder
del >nul *.cfg
REM create a destination for the packages (if one hasn't been made)
md "0. Complete Files\Files to Add to assetsfb.wad\packages\generated\characters"
REM move the fb packages to the correct folder
for /r %%x in (*.fb) do move >nul "%%x" "0. Complete Files\Files to Add to assetsfb.wad\packages\generated\characters"

REM copy additional files
if not %powerstyle%=="" (
	robocopy >nul /e /v "data\powerstyles" "0. Complete Files\Files to Add to assetsfb.wad\data\powerstyles" "%powerstyle%.engb"
)
if not %effectsFolder%=="" (
	robocopy >nul /e /v "effects\char\%effectsFolder%" "0. Complete Files\Files to Add to assetsfb.wad\effects\char\%effectsFolder%"
)
if not %soundfile%=="" (
	robocopy >nul /e /v "sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "0. Complete Files\sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "%soundfile%.zsm"
)

REM delete the compilers 
del >nul enter.vbs
del >nul fbbuilder.bat

REM for some reason, it doesn't like ending on a "data" command, so here's an empty echo line
echo.
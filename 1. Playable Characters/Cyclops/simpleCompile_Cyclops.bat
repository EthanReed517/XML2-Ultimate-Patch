@echo off
echo Compiling Playable Character - Cyclops

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character's packages
set packageName=cyclops_01
REM playable characters need the name of the xml packages listed as well
set xmlPackageName=cyclops_xml
REM define other values for the compiler
set comicCover=cyclops_cov
set effectsFolder=cyclop
set loadingScreen1=0101
set loadingScreen2=0102
set loadingScreen3=0103
set powerstyle=ps_cyclops
set soundFile=cyclop_m

REM ******************************
REM * Section 1 - Main Execution *
REM ******************************

REM create a folder where the files will go (if it's not already created)
md "0. Complete Files"
REM move into the folder where the cfg files are
cd "%~dp0\0. CFG Files\1. Playable Characters"
REM copy the cfg files out to the main folder
for /r %%x in (%packageName%*) do copy >nul "%%x" "..\.."
copy >nul "%xmlPackageName%.fb.cfg" "..\.."
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
robocopy >nul /e /v "data\powerstyles" "0. Complete Files\Files to Add to assetsfb.wad\data\powerstyles" "%powerstyle%.engb"
robocopy >nul /e /v "effects\char\%effectsFolder%" "0. Complete Files\Files to Add to assetsfb.wad\effects\char\%effectsFolder%"
robocopy >nul /e /v "sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "0. Complete Files\sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "%soundfile%.zsm"
robocopy >nul /e /v "textures\comic" "0. Complete Files\Files to Add to assetsfb.wad\textures\comic" "%comicCover%.igb"
robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen1%.igb"
robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen2%.igb"
robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen3%.igb"

REM delete the compilers 
del >nul enter.vbs
del >nul fbbuilder.bat

REM for some reason, it doesn't like ending on a "data" command, so here's an empty echo line
echo.
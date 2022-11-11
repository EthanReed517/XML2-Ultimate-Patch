@echo off
echo Compiling Playable Character - Emma Frost (Hero)

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character's packages
set packageName=emmafrost_hero_90
REM playable characters need the name of the xml packages listed as well
set xmlPackageName=emmafrost_hero_xml
REM define other values for the compiler
set comicCover=""
set effectsFolder=emmaf
set loadingScreen1=9001
set loadingScreen2=""
set loadingScreen3=""
set powerstyle=ps_emmafrost_hero
set soundFile=emmaf_m

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
REM Emma Frost works a bit differently because her diamond skins are skin-specific
REM rename all cfg files to something else so that fbbuilder won't go for them. 
ren *.cfg *.txt
REM skin 9001
ren emmafrost_hero_9001.fb.txt emmafrost_hero_9001.fb.cfg
ren emmafrost_hero_9001_nc.fb.txt emmafrost_hero_9001_nc.fb.cfg
call fbbuilder.bat
ren emmafrost_hero_9001.fb.cfg emmafrost_hero_9001.fb.txt
ren emmafrost_hero_9001_nc.fb.cfg emmafrost_hero_9001_nc.fb.txt
ren actors\9010.igb 9010_9001.igb
REM skin 9002
ren emmafrost_hero_9002.fb.txt emmafrost_hero_9002.fb.cfg
ren emmafrost_hero_9002_nc.fb.txt emmafrost_hero_9002_nc.fb.cfg
ren actors/9010_9002.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9002.fb.cfg emmafrost_hero_9002.fb.txt
ren emmafrost_hero_9002_nc.fb.cfg emmafrost_hero_9002_nc.fb.txt
ren actors\9010.igb 9010_9002.igb
REM skin 9003
ren emmafrost_hero_9003.fb.txt emmafrost_hero_9003.fb.cfg
ren emmafrost_hero_9003_nc.fb.txt emmafrost_hero_9003_nc.fb.cfg
ren actors/9010_9003.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9003.fb.cfg emmafrost_hero_9003.fb.txt
ren emmafrost_hero_9003_nc.fb.cfg emmafrost_hero_9003_nc.fb.txt
ren actors\9010.igb 9010_9003.igb
REM skin 9004
ren emmafrost_hero_9004.fb.txt emmafrost_hero_9004.fb.cfg
ren emmafrost_hero_9004_nc.fb.txt emmafrost_hero_9004_nc.fb.cfg
ren actors/9010_9004.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9004.fb.cfg emmafrost_hero_9004.fb.txt
ren emmafrost_hero_9004_nc.fb.cfg emmafrost_hero_9004_nc.fb.txt
ren actors\9010.igb 9010_9004.igb
REM skin 9005
ren emmafrost_hero_9005.fb.txt emmafrost_hero_9005.fb.cfg
ren emmafrost_hero_9005_nc.fb.txt emmafrost_hero_9005_nc.fb.cfg
ren actors/9010_9005.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9005.fb.cfg emmafrost_hero_9005.fb.txt
ren emmafrost_hero_9005_nc.fb.cfg emmafrost_hero_9005_nc.fb.txt
ren actors\9010.igb 9010_9005.igb
REM skin 9006
ren emmafrost_hero_9006.fb.txt emmafrost_hero_9006.fb.cfg
ren emmafrost_hero_9006_nc.fb.txt emmafrost_hero_9006_nc.fb.cfg
ren actors/9010_9006.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9006.fb.cfg emmafrost_hero_9006.fb.txt
ren emmafrost_hero_9006_nc.fb.cfg emmafrost_hero_9006_nc.fb.txt
ren actors\9010.igb 9010_9006.igb
REM skin 9007
ren emmafrost_hero_9007.fb.txt emmafrost_hero_9007.fb.cfg
ren emmafrost_hero_9007_nc.fb.txt emmafrost_hero_9007_nc.fb.cfg
ren actors/9010_9007.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9007.fb.cfg emmafrost_hero_9007.fb.txt
ren emmafrost_hero_9007_nc.fb.cfg emmafrost_hero_9007_nc.fb.txt
ren actors\9010.igb 9010_9007.igb
REM skin 9008
ren emmafrost_hero_9008.fb.txt emmafrost_hero_9008.fb.cfg
ren emmafrost_hero_9008_nc.fb.txt emmafrost_hero_9008_nc.fb.cfg
ren actors/9010_9008.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9008.fb.cfg emmafrost_hero_9008.fb.txt
ren emmafrost_hero_9008_nc.fb.cfg emmafrost_hero_9008_nc.fb.txt
ren actors\9010.igb 9010_9008.igb
REM skin 9009
ren emmafrost_hero_9009.fb.txt emmafrost_hero_9009.fb.cfg
ren emmafrost_hero_9009_nc.fb.txt emmafrost_hero_9009_nc.fb.cfg
ren actors/9010_9009.igb 9010.igb
call fbbuilder.bat
ren emmafrost_hero_9009.fb.cfg emmafrost_hero_9009.fb.txt
ren emmafrost_hero_9009_nc.fb.cfg emmafrost_hero_9009_nc.fb.txt
ren actors\9010.igb 9010_9009.igb
REM Restore original diamond skin name
ren actors\9010_9001.igb 9010.igb
ren *.txt *.cfg
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
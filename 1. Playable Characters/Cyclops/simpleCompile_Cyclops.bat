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
REM Cyclops works a bit differently because his visor boltons are skin-specific
REM rename all cfg files to something else so that fbbuilder won't go for them. 
ren *.cfg *.txt
REM skin 0101
ren cyclops_0101.fb.txt cyclops_0101.fb.cfg
ren cyclops_0101_nc.fb.txt cyclops_0101_nc.fb.cfg
call fbbuilder.bat
ren cyclops_0101.fb.cfg cyclops_0101.fb.txt
ren cyclops_0101_nc.fb.cfg cyclops_0101_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor01.igb
REM skin 0102
ren cyclops_0102.fb.txt cyclops_0102.fb.cfg
ren cyclops_0102_nc.fb.txt cyclops_0102_nc.fb.cfg
ren models/bolton/cyclops_visor02.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0102.fb.cfg cyclops_0102.fb.txt
ren cyclops_0102_nc.fb.cfg cyclops_0102_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor02.igb
REM skin 0103
ren cyclops_0103.fb.txt cyclops_0103.fb.cfg
ren cyclops_0103_nc.fb.txt cyclops_0103_nc.fb.cfg
ren models/bolton/cyclops_visor03.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0103.fb.cfg cyclops_0103.fb.txt
ren cyclops_0103_nc.fb.cfg cyclops_0103_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor03.igb
REM skin 0104
ren cyclops_0104.fb.txt cyclops_0104.fb.cfg
ren cyclops_0104_nc.fb.txt cyclops_0104_nc.fb.cfg
ren models/bolton/cyclops_visor04.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0104.fb.cfg cyclops_0104.fb.txt
ren cyclops_0104_nc.fb.cfg cyclops_0104_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor04.igb
REM skin 0105
ren cyclops_0105.fb.txt cyclops_0105.fb.cfg
ren cyclops_0105_nc.fb.txt cyclops_0105_nc.fb.cfg
ren models/bolton/cyclops_visor05.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0105.fb.cfg cyclops_0105.fb.txt
ren cyclops_0105_nc.fb.cfg cyclops_0105_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor05.igb
REM skin 0106
ren cyclops_0106.fb.txt cyclops_0106.fb.cfg
ren cyclops_0106_nc.fb.txt cyclops_0106_nc.fb.cfg
ren models/bolton/cyclops_visor06.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0106.fb.cfg cyclops_0106.fb.txt
ren cyclops_0106_nc.fb.cfg cyclops_0106_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor06.igb
REM skin 0107
ren cyclops_0107.fb.txt cyclops_0107.fb.cfg
ren cyclops_0107_nc.fb.txt cyclops_0107_nc.fb.cfg
ren models/bolton/cyclops_visor07.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0107.fb.cfg cyclops_0107.fb.txt
ren cyclops_0107_nc.fb.cfg cyclops_0107_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor07.igb
REM skin 0108
ren cyclops_0108.fb.txt cyclops_0108.fb.cfg
ren cyclops_0108_nc.fb.txt cyclops_0108_nc.fb.cfg
ren models/bolton/cyclops_visor08.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0108.fb.cfg cyclops_0108.fb.txt
ren cyclops_0108_nc.fb.cfg cyclops_0108_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor08.igb
REM skin 0109
ren cyclops_0109.fb.txt cyclops_0109.fb.cfg
ren cyclops_0109_nc.fb.txt cyclops_0109_nc.fb.cfg
ren models/bolton/cyclops_visor09.igb cyclops_visor.igb
call fbbuilder.bat
ren cyclops_0109.fb.cfg cyclops_0109.fb.txt
ren cyclops_0109_nc.fb.cfg cyclops_0109_nc.fb.txt
ren models/bolton/cyclops_visor.igb cyclops_visor09.igb
REM restore names
ren models\bolton\cyclops_visor01.igb cyclops_visor.igb
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
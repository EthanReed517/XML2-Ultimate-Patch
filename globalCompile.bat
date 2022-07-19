@echo off
echo Compiling X-Men Legends II

REM ***********************************
REM * Section 1 - Establish Variables *
REM ***********************************
echo [1] GameCube
echo [2] PlayStation 2
echo [3] PlayStation Portable (PSP)
echo [4] Xbox
set /p "consoleChoice=Which console are you using? [1,2,3,4] "
REM currently, the default skin pack will be the only option. BaconWizard17 will implement redesign and custom skin packs later
REM echo.
REM echo Skin pack not selected.
REM echo [1] Default skin pack
REM echo [2] Redesign skin pack
REM echo [3] Custom skin pack
REM set /p "skinPackChoice=Which skin pack will you be using? [1,2,3] "
set skinPackChoice=1
echo.
set /p "celChoice=Will you be using skins with cel shading? (Option will be ignored for PSP) [Y/N] "

REM ******************************
REM * Section 2 - Call Compilers *
REM ******************************
echo.
REM 1. Playable Characters
echo Compiling playable characters...
echo defaultman
cd "%~dp0\1. Playable Characters\defaultman"
call compile.bat %consoleChoice%
cd ..\..
echo Cyclops
cd "%~dp0\1. Playable Characters\Cyclops"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Storm
cd "%~dp0\1. Playable Characters\Storm"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Wolverine
cd "%~dp0\1. Playable Characters\Wolverine"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..

REM 3. General Data Files
echo Compiling general data files...
echo herostat
cd "%~dp0\3. General Data Files\herostat"
call compile.bat %consoleChoice%
cd ..\..
echo permanent
cd "%~dp0\3. General Data Files\permanent"
call compile.bat %consoleChoice%
cd ..\..
echo permanent fightstyles
cd "%~dp0\3. General Data Files\permanent fightstyles"
call compile.bat %consoleChoice%
cd ..\..

REM 4. Menus
echo Compiling menus...
echo Character select screen
cd "%~dp0\4. Menus\Character Select Screen"
call compile.bat %consoleChoice% %skinPackChoice%
cd ..\..
echo Comic Covers
cd "%~dp0\4. Menus\Comic Covers"
call compile.bat %consoleChoice%
cd ..\..
echo Loading Screens
cd "%~dp0\4. Menus\Loading Screens"
call compile.bat %consoleChoice%
cd ..\..
echo Main Menu
cd "%~dp0\4. Menus\Main Menu"
call compile.bat %consoleChoice%
cd ..\..

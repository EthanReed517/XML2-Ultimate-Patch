@echo off
echo Compiling X-Men Legends II
echo.
CHOICE /C YN /M "Call globalUpdate first? "
IF ERRORLEVEL 2 goto section1
IF ERRORLEVEL 1 goto globalUpdate

:globalUpdate
call globalUpdate.bat
goto section1

REM ***********************************
REM * Section 1 - Establish Variables *
REM ***********************************
:section1
echo [1] PC
echo [2] GameCube
echo [3] PlayStation 2
echo [4] PlayStation Portable (PSP)
echo [5] Xbox
CHOICE /C 12345 /M "Which console are you using? "
IF ERRORLEVEL 5 SET consoleChoice=XB & goto skinPackSection
IF ERRORLEVEL 4 SET consoleChoice=PSP & goto skinPackSection
IF ERRORLEVEL 3 SET consoleChoice=PS2 & goto skinPackSection
IF ERRORLEVEL 2 SET consoleChoice=GC & goto skinPackSection
IF ERRORLEVEL 1	SET consoleChoice=PC & goto modPackSection

:modPackSection
echo [1] XML2 Ultimate Patch     (X2UP)
echo [2] All X-Men Edition       (AXE)
echo [3] Brotherhood Edition     (BHE)
echo [4] Marvel Universe Edition (MUE)
CHOICE /C 1234 /M "Which Mod Pack are you using? "
IF ERRORLEVEL 4 SET modPackChoice=MUE & goto skinPackSection
IF ERRORLEVEL 3 SET modPackChoice=BHE & goto skinPackSection
IF ERRORLEVEL 2 SET modPackChoice=AXE & goto skinPackSection
IF ERRORLEVEL 1	SET modPackChoice=X2UP & goto skinPackSection

:skinPackSection
REM currently, the default skin pack will be the only option. BaconWizard17 will implement redesign and custom skin packs later
REM echo.
REM echo Skin pack not selected.
REM echo [1] Default skin pack
REM echo [2] Redesign skin pack
REM echo [3] Custom skin pack
REM set /p "skinPackChoice=Which skin pack will you be using? [1,2,3] "
set skinPackChoice=default
goto :celChoiceSection

:celChoiceSection
if not %consoleChoice%==PC (
	if not %consoleChoice%==PSP (
		echo.
		CHOICE /C YN /M "Are you using skins with cel shading? "
		IF ERRORLEVEL 2 SET "celChoice=no" & goto :section2
		IF ERRORLEVEL 1 SET "celChoice=yes" & goto :section2
	) else set "celChoice=no" & goto :section2
) else set "celChoice=no" & goto :section2

REM ******************************
REM * Section 2 - Call Compilers *
REM ******************************
:section2
echo.
REM 1. Playable Characters
echo Compiling playable characters...
echo defaultman
cd "%~dp0\1. Playable Characters\defaultman"
call compile.bat %consoleChoice%
cd ..\..
echo Beast
cd "%~dp0\1. Playable Characters\Beast"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Bishop
cd "%~dp0\1. Playable Characters\Bishop"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Colossus
cd "%~dp0\1. Playable Characters\Colossus"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Cyclops
cd "%~dp0\1. Playable Characters\Cyclops"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Deadpool
cd "%~dp0\1. Playable Characters\Deadpool"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Gambit
cd "%~dp0\1. Playable Characters\Gambit"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Iceman
cd "%~dp0\1. Playable Characters\Iceman"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Iron Man
cd "%~dp0\1. Playable Characters\Iron Man"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Jean Grey
cd "%~dp0\1. Playable Characters\Jean Grey"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Juggernaut
cd "%~dp0\1. Playable Characters\Juggernaut"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Magneto
cd "%~dp0\1. Playable Characters\Magneto"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Nightcrawler
cd "%~dp0\1. Playable Characters\Nightcrawler"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Professor X
cd "%~dp0\1. Playable Characters\Professor X"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Pyro
cd "%~dp0\1. Playable Characters\Pyro"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Rogue
cd "%~dp0\1. Playable Characters\Rogue"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Sabretooth
cd "%~dp0\1. Playable Characters\Sabretooth"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Scarlet Witch
cd "%~dp0\1. Playable Characters\Scarlet Witch"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Storm
cd "%~dp0\1. Playable Characters\Storm"
call compile.bat %consoleChoice% %skinPackChoice% %celChoice%
cd ..\..
echo Sunfire
cd "%~dp0\1. Playable Characters\Sunfire"
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
call compile.bat %consoleChoice% %modPackChoice%
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

REM 7. Sounds
echo Compiling sounds...
cd "%~dp0\7. Sounds"
call compile.bat %consoleChoice%
cd ..

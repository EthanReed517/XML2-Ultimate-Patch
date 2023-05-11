@echo off
echo Compiling Playable Character - Sabretooth_Hero

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character and their number
set charName=sabretooth_hero
set charNum=29
REM define other values for the compiler
set effectsFolder=pcsab
set loadingScreen1=2901
set loadingScreen2=""
set loadingScreen3=""
set powerstyle=ps_sabretooth_hero
set soundFile=pcsab_m

REM fill in if the character needs a special compilation process on consoles
REM (like Cyclops with his skin-specific visor)
REM options are Y or N
set specialCompile=N
REM if the character has a special compiler process, list the name here (no file extension)
set specialCompileName=""

REM ******************************
REM * Section 1 - Main Execution *
REM ******************************
REM copy the compiler
copy >nul "0. Compilers\1. Playable Characters\compileCommon.bat" "%~dp0"
REM execute the compiler
call compileCommon.bat
REM delete the compiler
del >nul compileCommon.bat
echo.
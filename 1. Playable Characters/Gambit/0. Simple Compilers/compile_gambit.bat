@echo off
echo Compiling Playable Character - Gambit

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character and their number
set charName=Gambit
set charNum=13
REM define other values for the compiler
set effectsFolder=gambit
set loadingScreen1=1301
set loadingScreen2=1302
set loadingScreen3=""
set powerstyle=ps_gambit
set soundFile=igam_m

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
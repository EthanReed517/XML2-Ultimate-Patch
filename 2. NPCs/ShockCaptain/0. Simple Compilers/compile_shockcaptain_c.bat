@echo off
echo Compiling NPC - ShockCaptain_c

REM **************************
REM * Section 0 - User Input *
REM **************************

REM get the name of the character and their number
set charName=shockcaptain_c
set charNum=95
REM define other values for the compiler
set effectsFolder=shk_c
set powerstyle=ps_shockcaptain
set soundFile=shk_c_m

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
copy >nul "0. Compilers\2. NPCs\compileCommon.bat" "%~dp0"
REM execute the compiler
call compileCommon.bat
REM delete the compiler
del >nul compileCommon.bat
echo.
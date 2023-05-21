@echo off
echo Compiling Energy Demon and Kojak's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM fill in the internal names and skin numbers of any NPCs for this character
set npcName1=energydemon_a
set npcNum1=6501
set npcName2=energydemon_b
set npcNum2=6502
set npcName3=energydemon_c
set npcNum3=6503
set npcName4=energydemon_d
set npcNum4=6502
set npcName5=kojak
set npcNum5=6501
set npcName6=""
set npcNum6=""

REM fill in if the character needs a special compilation process on consoles
REM (like Cyclops with his skin-specific visor)
REM options are Y or N
set specialCompile=N
REM if the character has a special compiler process, list the name here (no file extension)
set specialCompileName=""

REM ******************************
REM * Section 1 - Main Execution *
REM ******************************
REM Do not modify anything below this line!
REM copy the compiler
REM get the name of the current location of the batch file
for %%I in (.) do set CurrDirNameFull=%%~fI
REM back out to the XML2-UltimatePatch folder
:dircheck
for %%I in (.) do set CurrDirName=%%~nxI
if not "%CurrDirName%"=="XML2-Ultimate-Patch" (
	cd ..
	goto dircheck
)
REM copy the .bat file so it can be used
copy >nul "0. Compilers\compileNPC.bat" "%CurrDirNameFull%"
REM change back to the directory of the batch file
cd %CurrDirNameFull%

REM call the main compiler
call compileNPC.bat
del >nul compileNPC.bat

REM return from the compiler, display success message
echo Transfer Complete
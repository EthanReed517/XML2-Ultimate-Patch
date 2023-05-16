@ECHO OFF

REM ***************
REM * User Inputs *
REM ***************
REM Fill in the following variable prompts with the name of the files or leave it as "" if it doesn't apply

REM Data Entry Options
set codexEntry=""
set npcstatEntry1=Brood_Spawn
set npcstatEntry2=Critter_a
set npcstatEntry3=Critter_b
set npcstatEntry4=Critter_c
set npcstatEntry5=Critter_d
set npcstatEntry6=""
set reviewEntry=""

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
copy >nul "0. Update Scripts\updateNPC.bat" "%CurrDirNameFull%"
REM change back to the directory of the batch file
cd %CurrDirNameFull%

REM call the main compiler
call updateNPC.bat
del >nul updateNPC.bat

REM return from the compiler, display success message
echo Transfer Complete
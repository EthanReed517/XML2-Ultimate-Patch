@echo off
echo Compiling Assassin Droid's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM fill in the internal names and skin numbers of any NPCs for this character
set npcName1=assassindroid_a
set npcNum1=5301
set npcName2=assassindroid_b
set npcNum2=5302
set npcName3=assassindroid_c
set npcNum3=5303
set npcName4=assassindroid_d
set npcNum4=5303
set npcName5=""
set npcNum5=""
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
@echo off
echo Compiling Invisible Woman's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM playable character's internal name
set charName=invisiblewoman
REM playable character's first skin number
set charNum=17501
REM playable character's talents file
set talentsName=invisiblewoman

REM fill in the names and skin numbers of any NPCs for this character
set npcName1=""
set npcNum1=""
set npcName2=""
set npcNum2=""
set npcName3=""
set npcNum3=""

REM fill in which consoles the character is available on (options are Y or N):
set hasPC=Y
set hasGC=N
set hasPS2=N
set hasPSP=N
set hasXB=N

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
copy >nul "0. Compilers\compilePlayable.bat" "%CurrDirNameFull%"
REM change back to the directory of the batch file
cd %CurrDirNameFull%

REM call the main compiler
call compilePlayable.bat
del >nul compilePlayable.bat

REM return from the compiler, display success message
echo Transfer Complete
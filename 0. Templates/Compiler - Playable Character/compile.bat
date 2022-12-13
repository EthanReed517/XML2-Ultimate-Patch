@echo off
echo Compiling NAME's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM playable character's internal name
set charName=name
REM playable character's first skin number
set charNum=XX01
REM playable character's talents file
set talentsName=name

REM fill in the names and skin numbers of any NPCs for this character
set npcName1=name_mc
set npcNum1=200XX
set npcName2=namesimple
set npcNum2=XX01
set npcName3=sin_name
set npcNum3=XX00

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

pause
@ECHO OFF

REM ***************
REM * User Inputs *
REM ***************
REM Fill in the following variable prompts with the name of the files or leave it as "" if it doesn't apply

REM Data Entry Options
set codexEntry=ScarletWitch
set dangerEntry=ScarletWitch
set herostatEntry=ScarletWitch
set itemsEntry=ScarletWitch
set npcstatEntry1=ScarletWitch_MC
set npcstatEntry2=ScarletWitchSimple
set npcstatEntry3=""
set reviewEntry=ScarletWitch

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
copy >nul "0. Update Scripts\updatePlayable.bat" "%CurrDirNameFull%"
REM change back to the directory of the batch file
cd %CurrDirNameFull%

REM call the main compiler
call updatePlayable.bat
del >nul updatePlayable.bat

REM return from the compiler, display success message
echo Transfer Complete
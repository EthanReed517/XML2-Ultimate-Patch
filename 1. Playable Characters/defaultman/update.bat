@ECHO OFF
REM ***************
REM * User Inputs *
REM ***************
REM Fill in the following variable prompts with the name of the files or leave it as "" if it doesn't apply

REM Data Entry Options
set herostatEntry=Defaultman

REM ******************
REM * Code Execution *
REM ******************

REM section for data entries
echo Copying data entries to data files...
if not %herostatEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Herostat_%herostatEntry%.txt" "..\..\3. General Data Files\herostat\1. Base Assets\0. Herostat Entries\%herostatEntry%.txt"
)
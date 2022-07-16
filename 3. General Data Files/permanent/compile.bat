@echo off
echo Compiling permanent.fb

REM ***********************************
REM * Section 1 - Establish Variables *
REM ***********************************

REM get console choice from main compiler script
set "consoleChoice=%~1"
goto :consoleChoiceCheck
REM console not selected, main compiler prompt not used, pick console
:consoleChoicePrompt
echo.
echo Console not selected.
echo [1] GameCube
echo [2] PlayStation 2
echo [3] PlayStation Portable (PSP)
echo [4] Xbox
set /p "consoleChoice=Which console are you using? [1,2,3,4] "
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto :consoleChoicePrompt

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************

REM Begin compiling assets
echo Compiling assets...
md "0. Staging"
robocopy >nul /e /v "1. Base Assets" "0. Staging"
REM proceed based on console selection
if %consoleChoice%==1 goto :compileGameCube
if %consoleChoice%==2 goto :compilePS2
if %consoleChoice%==3 goto :compilePSP
if %consoleChoice%==4 goto :compileXbox

REM GameCube options
:compileGameCube
robocopy >nul /e /v "2. Default Assets - GameCube" "0. Staging"
goto :end

REM PS2 options
:compilePS2
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
goto :end

REM PSP options
:compilePSP
robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
goto :end

REM xbox options
:compileXbox
robocopy >nul /e /v "2. Default Assets - Xbox" "0. Staging"
goto :end

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:end
copy >nul "..\..\0. Compilers" "0. Staging"
REM change directory to 0. Staging folder, run fbbuilder, then change back to main directory
cd "%~dp0\0. Staging"
call fbbuilder.bat
del >nul *.cfg
cd ..
REM Only FB packages are needed at this point; loose files are compiled from other places
REM so anything that's not a .fb file can be deleted
md "0. Staging2"
for /r "0. Staging" %%x in (*.fb) do move >nul "%%x" "0. Staging2"
rmdir /s /q "0. Staging"
ren "0. Staging2" "0. Staging"

REM move files and clean up
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\packages\generated\maps\package"
rmdir /s /q "0. Staging"
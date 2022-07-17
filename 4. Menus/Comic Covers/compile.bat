@echo off
echo Compiling comic covers

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
if %consoleChoice%==1 goto :compileGameCube
if %consoleChoice%==2 goto :compilePS2
if %consoleChoice%==3 goto :compilePSP
if %consoleChoice%==4 goto :compileXbox

:compileGameCube
robocopy >nul /e /v "2. Default Assets - GameCube" "..\..\0. Ready Files\assetsfb Files"
goto :end

:compilePS2
robocopy >nul /e /v "2. Default Assets - PS2" "..\..\0. Ready Files\assetsfb Files"
goto :end

:compilePSP
robocopy >nul /e /v "2. Default Assets - PSP" "..\..\0. Ready Files\assetsfb Files"
goto :end

:compileXbox
robocopy >nul /e /v "2. Default Assets - Xbox" "..\..\0. Ready Files\assetsfb Files"
goto :end

:end
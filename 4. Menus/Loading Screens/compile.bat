@echo off
echo Compiling loading screens

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
echo [1] PC
echo [2] GameCube
echo [3] PlayStation 2
echo [4] PlayStation Portable (PSP)
echo [5] Xbox
CHOICE /C 12345 /M "Which console are you using? "
IF ERRORLEVEL 5 SET consoleChoice=XB & goto :section2
IF ERRORLEVEL 4 SET consoleChoice=PSP & goto :section2
IF ERRORLEVEL 3 SET consoleChoice=PS2 & goto :section2
IF ERRORLEVEL 2 SET consoleChoice=GC & goto :section2
IF ERRORLEVEL 1	SET consoleChoice=PC & goto :section2
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto :consoleChoicePrompt

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************
:section2
if %consoleChoice%==PC goto :movePC
if %consoleChoice%==GC goto :moveGameCube
if %consoleChoice%==PS2 goto :movePS2
if %consoleChoice%==PSP goto :movePSP
if %consoleChoice%==XB goto :moveXbox

:movePC
robocopy >nul /e /v "1. Base Assets" "..\..\0. Ready Files"
goto :end

:moveGameCube
robocopy >nul /e /v "2. Default Assets - GameCube\textures" "..\..\0. Ready Files\assetsfb Files\textures"
robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Loading Screens" "..\..\0. Ready Files\2. Bonus Loading Screens"
goto :end

:movePS2
robocopy >nul /e /v "2. Default Assets - PS2\textures" "..\..\0. Ready Files\assetsfb Files\textures"
robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Loading Screens" "..\..\0. Ready Files\2. Bonus Loading Screens"
goto :end

:movePSP
robocopy >nul /e /v "2. Default Assets - PSP\textures" "..\..\0. Ready Files\assetsfb Files\textures"
goto :end

:moveXbox
robocopy >nul /e /v "1. Base Assets\textures" "..\..\0. Ready Files\assetsfb Files\textures"
robocopy >nul /e /v "1. Base Assets\2. Bonus Loading Screens" "..\..\0. Ready Files\2. Bonus Loading Screens"
goto :end

:end
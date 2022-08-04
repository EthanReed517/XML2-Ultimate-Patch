@echo off
echo Compiling herostat

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
IF ERRORLEVEL 1	SET consoleChoice=PC & goto :modPackSection
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto :consoleChoicePrompt

:modPackSection
REM get mod pack choice from main compiler script
set "modPackChoice=%~2"
goto :modPackChoiceCheck
REM mod pack not selected, main compiler prompt not used, pick mod pack
:modPackChoicePrompt
echo.
echo Mod Pack not selected.
echo [1] XML2 Ultimate Patch     (X2UP)
echo [2] All X-Men Edition       (AXE)
echo [3] Brotherhood Edition     (BHE)
echo [4] Marvel Universe Edition (MUE)
CHOICE /C 1234 /M "Which Mod Pack are you using? "
IF ERRORLEVEL 4 SET modPackChoice=MUE & goto :section2
IF ERRORLEVEL 3 SET modPackChoice=BHE & goto :section2
IF ERRORLEVEL 2 SET modPackChoice=AXE & goto :section2
IF ERRORLEVEL 1	SET modPackChoice=X2UP & goto :section2
REM Checks if mod pack was selected from main compiler script/if main compiler script was used
:modPackChoiceCheck
if "%modPackChoice%"=="" goto :modPackChoicePrompt

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************
:section2
REM Begin compiling assets
echo Compiling assets...
md "0. Staging"
REM proceed based on console selection
if %consoleChoice%==PSP goto :movePSP
if %consoleChoice%==PC goto :movePC
goto :moveConsole

:moveConsole
copy >nul "1. Base Assets\herostat.engb.json" "0. Staging"
goto :compile

:movePC
if %modPackChoice%==X2UP copy >nul "2. Default Assets - PC\herostat.engb.json" "0. Staging"
if %modPackChoice%==AXE copy >nul "2. Default Assets - PC\heroreal.engb.json" "0. Staging"
if %modPackChoice%==BHE copy >nul "2. Default Assets - PC\herosbro.engb.json" "0. Staging"
if %modPackChoice%==MUE copy >nul "2. Default Assets - PC\heromarv.engb.json" "0. Staging"
goto :compile

:movePSP
copy >nul "2. Default Assets - PSP\herostat.engb.json" "0. Staging"
goto :compile

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compile
copy >nul "..\..\0. Compilers\ravenFormatsCompile.bat" "0. Staging"
cd "%~dp0\0. Staging"
cmd /c ravenFormatsCompile.bat
del >nul *.json
del >nul *.bat
cd ..
if %consoleChoice%==PC (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\data"
	goto :end
)
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\assetsfb Files\data"
goto :end

:end
rmdir /s /q "0. Staging"

@echo off
echo Compiling Defaultman's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM fill in the name of the character's simple compilers here (without the file extension)
set simpleCompilePlayable=simpleCompile_Defaultman

goto consoleChoiceSection

:unneeded
REM files on the PC that aren't modified by the X2UP can be listed here
if  %consoleChoice%==PC (
	echo.
	REM nothing here. Keeping just in case
)
goto compilePCcont

REM ***********************************
REM * Section 1 - Establish Variables *
REM ***********************************

:consoleChoiceSection
REM get console choice from main compiler script
set "consoleChoice=%~1"
goto consoleChoiceCheck
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
IF ERRORLEVEL 5 SET consoleChoice=XB & goto modeChoiceSection
IF ERRORLEVEL 4 SET consoleChoice=PSP & goto modeChoiceSection
IF ERRORLEVEL 3 SET consoleChoice=PS2 & goto modeChoiceSection
IF ERRORLEVEL 2 SET consoleChoice=GC & goto modeChoiceSection
IF ERRORLEVEL 1	SET consoleChoice=PC & set modeChoice=full & goto section2
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto consoleChoicePrompt

:modeChoiceSection
REM get mode choice from main compiler script
set "modeChoice=%~2"
goto modeChoiceCheck
REM mode not selected, main compiler prompt not used, pick mode
:modeChoicePrompt
echo.
echo Mode not selected.
echo [1] Full build: builds the character files for the full X2UP.
echo [2] Partial build: alternate full release without building the packages.
CHOICE /C 12 /M "Which build will you use? "
IF ERRORLEVEL 2 SET modeChoice=partial & goto section2
IF ERRORLEVEL 1	SET modeChoice=full & goto section2
REM Checks if mode was selected from main compiler script/if main compiler script was used
:modeChoiceCheck
if "%modeChoice%"=="" goto modeChoicePrompt

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************

:section2
REM Begin compiling assets
echo Compiling assets...
md "0. Staging"
robocopy >nul /e /v "1. Base Assets" "0. Staging"
REM proceed based on console selection
if %consoleChoice%==PC goto movePC
if %consoleChoice%==GC goto moveGameCube
if %consoleChoice%==PS2 goto movePS2
if %consoleChoice%==PSP goto movePSP
if %consoleChoice%==XB goto moveXbox

REM PC options
:movePC
REM default assets are included regardless of skin pack choice
REM assets without cel shading are stored in a separate folder for the PC
REM they're easy to move, so they'll be left in
robocopy >nul /e /v "2. Default Assets - PC" "0. Staging"
goto compilePC

REM GameCube options
:moveGameCube
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - GameCube" "0. Staging"
goto compileConsole

REM PS2 options
:movePS2
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
goto compileConsole

REM PSP options
:movePSP
REM default assets are included regardless of skin pack choice
REM PSP does not use cel shading, so the cel shading option is ignored
robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
goto compileConsole

REM xbox options
:moveXbox
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - Xbox" "0. Staging"
goto compileConsole

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compileConsole
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM for the partial build, move in the compiler. 
if not %modeChoice%==full (
	md "0. Staging\0. Compilers\1. Playable Characters"
	copy >nul "%simpleCompilePlayable%.bat" "0. Staging\0. Compilers\1. Playable Characters\%simpleCompilePlayable:~6%.bat"
)
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
if %modeChoice%==full (
	REM run fbbuilder
	call fbbuilder.bat
	REM move packages to proper place
	md "packages\generated\characters"
	for /r %%x in (*.fb) do move >nul "%%x" "packages\generated\characters"
)
if not %modeChoice%==full (
	md "0. CFG Files\1. Playable Characters"
	for %%x in (*.cfg) do move >nul "%%x" "0. CFG Files\1. Playable Characters"
)
goto cleanUp

:compilePC
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
goto unneeded
:compilePCCont
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM compile data files
cmd /c ravenFormatsCompile.bat
goto cleanUp

:cleanUp
del /s >nul *.json
REM clean up extra stuff
if %consoleChoice%==PC (
	del >nul *.cfg
) else if %modeChoice%==full (
	del >nul *.cfg
)
del >nul enter.vbs
del >nul fbbuilder.bat
del >nul ravenFormatsCompile.bat
if %consoleChoice%==PC goto finalizePC
goto finalizeConsole

:finalizeConsole
REM move back to the main folder
cd ..
REM need to remove any files that are in the packages
REM this only applies for full mode. Other modes are not in packages
if %modeChoice%==full (
	rmdir /s /q "0. Staging/actors"
	rmdir /s /q "0. Staging/hud"
	rmdir /s /q "0. Staging/ui"
)
REM move files and clean up
if %modeChoice%==full (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\Files to Add to assetsfb.wad"
)
if %modeChoice%==partial (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
)
rmdir /s /q "0. Staging"
goto end

:finalizePC
REM move back to the main folder
cd ..
REM move files and clean up
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
rmdir /s /q "0. Staging"
goto end

:end
echo Transfer Complete
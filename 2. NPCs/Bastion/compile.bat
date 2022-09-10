@echo off
echo Compiling Bastion's NPC assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

goto consoleChoiceSection

:unneeded
REM files on the PC that aren't modified by the X2UP can be listed here
if  %consoleChoice%==PC (
	del >nul "0. Staging\actors\42_bastion.igb"
	rmdir /s /q "0. Staging\data"
	rmdir /s /q "0. Staging\effects"
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
IF ERRORLEVEL 5 SET consoleChoice=XB & goto celChoiceSection
IF ERRORLEVEL 4 SET consoleChoice=PSP & goto celChoiceSection
IF ERRORLEVEL 3 SET consoleChoice=PS2 & goto celChoiceSection
IF ERRORLEVEL 2 SET consoleChoice=GC & goto celChoiceSection
IF ERRORLEVEL 1	SET consoleChoice=PC & goto celChoiceSection
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto consoleChoicePrompt

REM get cel shading choice from main compiler script (ignored for PC and PSP)
:celChoiceSection
set "celChoice=%~2"
goto celChoiceCheck
REM cel shading option not selected, main compiler prompt not used, pick cel shading option
:celChoicePrompt
if not %consoleChoice%==PC (
	if not %consoleChoice%==PSP (
		CHOICE /C YN /M "Are you using skins with cel shading? "
		IF ERRORLEVEL 2 SET "celChoice=no" & goto section2
		IF ERRORLEVEL 1 SET "celChoice=yes" & goto section2
	) else set "celChoice=no" & goto section2
) else set "celChoice=no" & goto section2
REM Checks if cel shading choice was selected from main compiler script/if main compiler script was used
:celChoiceCheck
if "%celChoice%"=="" goto celChoicePrompt

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
if %celChoice%==no (
	robocopy >nul /e /v "2. Default Assets - GameCube\3. No Cel Shade Assets" "0. Staging"
)
goto compileConsole

REM PS2 options
:movePS2
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
if %celChoice%==no (
	robocopy >nul /e /v "2. Default Assets - PS2\3. No Cel Shade Assets" "0. Staging"
)
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
if %celChoice%==N (
	robocopy >nul /e /v "2. Default Assets - Xbox\3. No Cel Shade Assets" "0. Staging"
)
goto compileConsole

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compileConsole
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Comic Covers" (
	rmdir /s /q "0. Staging\2. Bonus Comic Covers"
)
if exist "0. Staging\2. Bonus Features" (
	rmdir /s /q "0. Staging\2. Bonus Features"
)
if exist "0. Staging\2. Bonus Loading Screens" (
	rmdir /s /q "0. Staging\2. Bonus Loading Screens"
)
if exist "0. Staging\2. Comics for XML1 and PSP Characters" (
	rmdir /s /q "0. Staging\2. Comics for XML1 and PSP Characters"
)
rmdir /s /q "0. Staging\3. No Cel Shade Assets""
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM compile data files
cmd /c ravenFormatsCompile.bat
REM run fbbuilder
call fbbuilder.bat
REM move packages to proper place
md "packages\generated\characters"
for /r %%x in (*.fb) do move >nul "%%x" "packages\generated\characters"
goto cleanUp

:compilePC
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Comic Covers" (
	rmdir /s /q "0. Staging\2. Bonus Comic Covers"
)
if exist "0. Staging\2. Bonus Features" (
	rmdir /s /q "0. Staging\2. Bonus Features"
)
if exist "0. Staging\2. Bonus Loading Screens" (
	rmdir /s /q "0. Staging\2. Bonus Loading Screens"
)
if exist "0. Staging\2. Comics for XML1 and PSP Characters" (
	rmdir /s /q "0. Staging\2. Comics for XML1 and PSP Characters"
)
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
del >nul *.cfg
del >nul enter.vbs
del >nul fbbuilder.bat
del >nul ravenFormatsCompile.bat
if %consoleChoice%==PC goto finalizePC
goto finalizeConsole

:finalizeConsole
REM move back to the main folder
cd ..
REM need to remove any files that are in the packages
rmdir /s /q "0. Staging/actors"
rmdir /s /q "0. Staging/hud"
rmdir /s /q "0. Staging/sounds"
rmdir /s /q "0. Staging/textures"
rmdir /s /q "0. Staging/ui"
if exist "0. Staging/data/entities" (
	rmdir /s /q "0. Staging/data/entities"
)
if exist "0. Staging/data/fightstyles" (
	rmdir /s /q "0. Staging/data/fightstyles"
)
if exist "0. Staging/models" (
	rmdir /s /q "0. Staging/models"
)
REM move files and clean up
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\Files to Add to assetsfb.wad"
rmdir /s /q "0. Staging"
goto end

:finalizePC
REM move back to the main folder
cd ..
REM remove any files that are stored elsewhere
rmdir /s /q "0. Staging/sounds"
rmdir /s /q "0. Staging/textures/comic"
rmdir /s /q "0. Staging/textures/loading"
rmdir /s /q "0. Staging/ui/models"
REM move files and clean up
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
rmdir /s /q "0. Staging"
goto end

:end
echo Transfer Complete
@echo off
echo Compiling Storm's character assets 
REM ***FILL IN CHARACTER NAME HERE***

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
IF ERRORLEVEL 5 SET consoleChoice=XB & goto :skinPackSection
IF ERRORLEVEL 4 SET consoleChoice=PSP & goto :skinPackSection
IF ERRORLEVEL 3 SET consoleChoice=PS2 & goto :skinPackSection
IF ERRORLEVEL 2 SET consoleChoice=GC & goto :skinPackSection
IF ERRORLEVEL 1	SET consoleChoice=PC & goto :skinPackSection
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto :consoleChoicePrompt

REM get skin pack choice from main compiler script
:skinPackSection
set "skinPackChoice=%~3"
goto :skinPackChoiceCheck
REM skin pack not selected, main compiler prompt not used, pick skin pack
:skinPackChoicePrompt
echo.
echo Skin pack not selected.
echo [1] Default skin pack
echo [2] Redesign skin pack
echo [3] Custom skin pack
CHOICE /C 123 /M "Which skin pack are you using? "
IF ERRORLEVEL 3 SET "skinPackChoice=custom" & goto :celChoiceSection
IF ERRORLEVEL 2 SET "skinPackChoice=redesign" & goto :celChoiceSection
IF ERRORLEVEL 1 SET "skinPackChoice=default" & goto :celChoiceSection
REM Checks if skin pack was selected from main compiler script/if main compiler script was used
:skinPackChoiceCheck
if "%skinPackChoice%"=="" goto :skinPackChoicePrompt

REM get cel shading choice from main compiler script (ignored for PC and PSP)
:celChoiceSection
set "celChoice=%~4"
goto :celChoiceCheck
REM cel shading option not selected, main compiler prompt not used, pick cel shading option
:celChoicePrompt
if not %consoleChoice%==PC (
	if not %consoleChoice%==PSP (
		CHOICE /C YN /M "Are you using skins with cel shading? "
		IF ERRORLEVEL 2 SET "celChoice=no" & goto :section2
		IF ERRORLEVEL 1 SET "celChoice=yes" & goto :section2
	) else set "celChoice=no" & goto :section2
) else set "celChoice=no" & goto :section2
REM Checks if cel shading choice was selected from main compiler script/if main compiler script was used
:celChoiceCheck
if "%celChoice%"=="" goto :celChoicePrompt

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************

:section2
REM Begin compiling assets
echo Compiling assets...
md "0. Staging"
robocopy >nul /e /v "1. Base Assets" "0. Staging"
REM proceed based on console selection
if %consoleChoice%==PC goto :movePC
if %consoleChoice%==GC goto :moveGameCube
if %consoleChoice%==PS2 goto :movePS2
if %consoleChoice%==PSP goto :movePSP
if %consoleChoice%==XB goto :moveXbox

REM PC options
:movePC
REM default assets are included regardless of skin pack choice
REM assets without cel shading are stored in a separate folder for the PC
REM they're easy to move, so they'll be left in
robocopy >nul /e /v "2. Default Assets - PC" "0. Staging"
if %skinPackChoice%==redesign (
	robocopy >nul /e /v "3. Redesign Assets - PC" "0. Staging"
)
if %skinPackChoice%==custom (
	robocopy >nul /e /v "4. Custom Assets - PC" "0. Staging"
)
goto :compilePC


REM GameCube options
:moveGameCube
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - GameCube" "0. Staging"
if %celChoice%==no (
	robocopy >nul /e /v "2. Default Assets - GameCube\3. No Cel Shade Assets" "0. Staging"
)
if %skinPackChoice%==redesign (
	robocopy >nul /e /v "3. Redesign Assets - GameCube" "0. Staging"
)
if %skinPackChoice%==custom (
	robocopy >nul /e /v "4. Custom Assets - GameCube" "0. Staging"
	if %celChoice%==no (
		robocopy >nul /e /v "4. Custom Assets - GameCube\3. No Cel Shade Assets" "0. Staging"
	)
)
goto :icons1

REM PS2 options
:movePS2
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
if %celChoice%==no (
	robocopy >nul /e /v "2. Default Assets - PS2\3. No Cel Shade Assets" "0. Staging"
)
if %skinPackChoice%==redesign (
	robocopy >nul /e /v "3. Redesign Assets - PS2" "0. Staging"
)
if %skinPackChoice%==custom (
	robocopy >nul /e /v "4. Custom Assets - PS2" "0. Staging"
	if %celChoice%==no (
		robocopy >nul /e /v "4. Custom Assets - PS2\3. No Cel Shade Assets" "0. Staging"
	)
)
goto :icons1

REM PSP options
:movePSP
REM default assets are included regardless of skin pack choice
REM PSP does not use cel shading, so the cel shading option is ignored
robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
if %skinPackChoice%==redesign (
	robocopy >nul /e /v "3. Redesign Assets - PSP" "0. Staging"
)
if %skinPackChoice%==custom (
	robocopy >nul /e /v "4. Custom Assets - PSP" "0. Staging"
)
goto :icons1

REM xbox options
:moveXbox
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - Xbox" "0. Staging"
if %celChoice%==N (
	robocopy >nul /e /v "2. Default Assets - Xbox\3. No Cel Shade Assets" "0. Staging"
)
if %skinPackChoice%==2 (
	robocopy >nul /e /v "3. Redesign Assets - Xbox" "0. Staging"
)
if %skinPackChoice%==3 (
	robocopy >nul /e /v "4. Custom Assets - Xbox" "0. Staging"
	if %celChoice%==N (
		robocopy >nul /e /v "4. Custom Assets - Xbox\3. No Cel Shade Assets" "0. Staging"
	)
)
goto :compileConsole

REM for GameCube, PS2, and PSP, the talents file needs to use icons1 instead of icons2
:icons1
move >nul "0. Staging\data\talents\cyclops.engb.json" "0. Staging"
copy >nul "..\..\0. Utilities\icons1console.py" "0. Staging"
copy >nul compile.ini "0. Staging"
REM change directory to 0. Staging folder
cd "%~dp0\0. Staging"
python icons1console.py
cd ..
del >nul "0. Staging\icons1console.py"
del >nul "0. Staging\compile.ini"
move >nul "0. Staging\cyclops.engb.json" "0. Staging\data\talents"
goto :compileConsole

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compileConsole
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
rmdir /s /q "0. Staging\2. Bonus Comic Covers"
rmdir /s /q "0. Staging\2. Bonus Loading Screens"
rmdir /s /q "0. Staging\3. No Cel Shade Assets"
REM copy python script for creating additional cfg files
copy >nul "..\..\0. Utilities\cfgCreate.py" "0. Staging"
copy >nul compile.ini "0. Staging"
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM create cfgs and compile data files
python cfgCreate.py
cmd /c ravenFormatsCompile.bat
del /s >nul *.json
REM run fbbuilder
call fbbuilder.bat
REM clean up extra stuff
del >nul *.cfg
del >nul enter.vbs
del >nul fbbuilder.bat
del >nul ravenFormatsCompile.bat
del >nul cfgCreate.py
del >nul compile.ini
REM move packages to proper place
md "packages\generated\characters"
for /r %%x in (*.fb) do move >nul "%%x" "packages\generated\characters"
REM move back to the main folder
cd ..

REM need to remove any files that are in the packages
rmdir /s /q "0. Staging/actors"
rmdir /s /q "0. Staging/data/entities"
rmdir /s /q "0. Staging/data/talents"
rmdir /s /q "0. Staging/hud"
rmdir /s /q "0. Staging/sounds"
rmdir /s /q "0. Staging/textures"
rmdir /s /q "0. Staging/ui"

REM move files and clean up
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\assetsfb Files"
rmdir /s /q "0. Staging"

goto :end

:compilePC
REM can remove unneeded folders
rmdir /s /q "0. Staging\1. Data Entries"
rmdir /s /q "0. Staging\2. Bonus Comic Covers"
rmdir /s /q "0. Staging\2. Bonus Loading Screens"
REM copy python script for creating additional pkgb files
copy >nul "..\..\0. Utilities\packageCreate.py" "0. Staging"
copy >nul compile.ini "0. Staging"
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM move packages
move >nul "0. Staging\packages\generated\characters\storm_0401.pkgb.json" "0. Staging"
move >nul "0. Staging\packages\generated\characters\storm_0401_nc.pkgb.json" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM create packages and compile data files
python packageCreate.py
cmd /c ravenFormatsCompile.bat
del /s >nul *.json
REM clean up extra stuff
del >nul *.cfg
del >nul enter.vbs
del >nul fbbuilder.bat
del >nul ravenFormatsCompile.bat
del >nul packageCreate.py
del >nul compile.ini
REM move packages back to the correct place
move >nul *.pkgb packages\generated\characters
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

goto :end

:end
echo Transfer Complete
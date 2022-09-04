@echo off
echo Compiling Magneto's character assets 

REM **************************
REM * Section 0 - User Input *
REM **************************

REM fill in the name of the character's PC packages here
set pcPkgb=magneto_2501.pkgb.json
set pcPkgbNc=magneto_2501_nc.pkgb.json

REM fill in the name of the character's talents file here (without the file extension)
set talentsName=magneto

goto consoleChoiceSection

:unneeded
REM files on the PC that aren't modified by the X2UP can be listed here
if  %consoleChoice%==PC (
	del >nul "0. Staging\actors\25_magneto.igb"
	del >nul "0. Staging\actors\128_civilian_male.igb"
	del >nul "0. Staging\actors\200_magneto.igb"
	rmdir /s /q "0. Staging\models"
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
IF ERRORLEVEL 1 SET consoleChoice=PC & goto modeChoiceSection
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
echo Console not selected.
echo [1] Full build: builds the character files for the full X2UP.
echo [2] Solo build: builds the character for individual release.
CHOICE /C 12 /M "Which build will you use? "
IF ERRORLEVEL 2 SET modeChoice=solo & set celChoice=yes & goto section2
IF ERRORLEVEL 1	SET modeChoice=full & goto celChoiceSection
REM Checks if console was selected from main compiler script/if main compiler script was used
:modeChoiceCheck
if "%modeChoice%"=="" goto modeChoicePrompt

REM get cel shading choice from main compiler script (ignored for PC and PSP)
:celChoiceSection
set "celChoice=%~3"
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
if %modeChoice%==solo (
	md "0. Release"
)
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
goto icons1

REM PS2 options
:movePS2
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
if %celChoice%==no (
	robocopy >nul /e /v "2. Default Assets - PS2\3. No Cel Shade Assets" "0. Staging"
)
goto icons1

REM PSP options
:movePSP
REM default assets are included regardless of skin pack choice
REM PSP does not use cel shading, so the cel shading option is ignored
robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
goto icons1

REM xbox options
:moveXbox
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - Xbox" "0. Staging"
if %celChoice%==N (
	robocopy >nul /e /v "2. Default Assets - Xbox\3. No Cel Shade Assets" "0. Staging"
)
goto compileConsole

REM for GameCube, PS2, and PSP, the talents file needs to use icons1 instead of icons2
:icons1
move >nul "0. Staging\data\talents\%talentsName%.engb.json" "0. Staging"
copy >nul "..\..\0. Utilities\icons1console.py" "0. Staging"
copy >nul compile.ini "0. Staging"
REM change directory to 0. Staging folder
cd "%~dp0\0. Staging"
python icons1console.py
cd ..
del >nul "0. Staging\icons1console.py"
del >nul "0. Staging\compile.ini"
move >nul "0. Staging\%talentsName%.engb.json" "0. Staging\data\talents"
goto compileConsole

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compileConsole
REM can remove unneeded folders
REM for a solo build, files need to be moved to the release
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\1. Data Entries" "0. Release\1. Data Entries"
) 
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Comic Covers" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Comic Covers" "0. Release\2. Bonus Comic Covers"
	) 
	rmdir /s /q "0. Staging\2. Bonus Comic Covers"
)
if exist "0. Staging\2. Bonus Features" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Features" "0. Release\2. Bonus Features"
	) 
	rmdir /s /q "0. Staging\2. Bonus Features"
)
if exist "0. Staging\2. Bonus Loading Screens" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Loading Screens" "0. Release\2. Bonus Loading Screens"
	) 
	rmdir /s /q "0. Staging\2. Bonus Loading Screens"
)
if exist "0. Staging\2. Comics for XML1 and PSP Characters" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Comics for XML1 and PSP Characters" "0. Release\2. Comics for XML1 and PSP Characters"
	) 
	rmdir /s /q "0. Staging\2. Comics for XML1 and PSP Characters"
)
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\3. No Cel Shade Assets" "0. Release\3. No Cel Shade Assets"
) 
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
REM run fbbuilder
call fbbuilder.bat
REM move packages to proper place
md "packages\generated\characters"
for /r %%x in (*.fb) do move >nul "%%x" "packages\generated\characters"
goto cleanUp

:compilePC
REM can remove unneeded folders
REM for a solo build, files need to be moved to the release
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\1. Data Entries" "0. Release\1. Data Entries"
) 
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Comic Covers" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Comic Covers" "0. Release\2. Bonus Comic Covers"
	) 
	rmdir /s /q "0. Staging\2. Bonus Comic Covers"
)
if exist "0. Staging\2. Bonus Features" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Features" "0. Release\2. Bonus Features"
	) 
	rmdir /s /q "0. Staging\2. Bonus Features"
)
if exist "0. Staging\2. Bonus Loading Screens" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Bonus Loading Screens" "0. Release\2. Bonus Loading Screens"
	) 
	rmdir /s /q "0. Staging\2. Bonus Loading Screens"
)
if exist "0. Staging\2. Comics for XML1 and PSP Characters" (
	if %modeChoice%==solo (
		robocopy >nul /e /v "0. Staging\2. Comics for XML1 and PSP Characters" "0. Release\2. Comics for XML1 and PSP Characters"
	) 
	rmdir /s /q "0. Staging\2. Comics for XML1 and PSP Characters"
)
goto unneeded
:compilePCCont
REM copy python script for creating additional pkgb files
copy >nul "..\..\0. Utilities\packageCreate.py" "0. Staging"
copy >nul compile.ini "0. Staging"
REM copy compilers
copy >nul "..\..\0. Compilers" "0. Staging"
REM move packages
move >nul "0. Staging\packages\generated\characters\%pcPkgb%" "0. Staging"
move >nul "0. Staging\packages\generated\characters\%pcPkgbNc%" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM create packages and compile data files
python packageCreate.py
cmd /c ravenFormatsCompile.bat
REM move packages back to the correct place
for /r %%x in (*.pkgb) do move >nul "%%x" "packages\generated\characters"
goto cleanUp

:cleanUp
del /s >nul *.json
REM clean up extra stuff
del >nul *.cfg
del >nul enter.vbs
del >nul fbbuilder.bat
del >nul ravenFormatsCompile.bat
del >nul cfgCreate.py
del >nul packageCreate.py
del >nul compile.ini
if %consoleChoice%==PC goto finalizePC
goto finalizeConsole

:finalizeConsole
REM move back to the main folder
cd ..
REM need to remove any files that are in the packages
REM for solo build, files need to be moved to the release instead of deleted
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\sounds" "0. Release\sounds"
	robocopy >nul /e /v "0. Staging\textures\comic" "0. Release\Files to Add to assetsfb.wad\textures\comic"
	robocopy >nul /e /v "0. Staging\textures\loading" "0. Release\Files to Add to assetsfb.wad\textures\loading"
	robocopy >nul /e /v "0. Staging\ui\models\characters" "0. Release\Character Select Portrait"
) 
rmdir /s /q "0. Staging/actors"
rmdir /s /q "0. Staging/data/talents"
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
if %modeChoice%==full (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\Files to Add to assetsfb.wad"
) else (
	robocopy >nul /e /v "0. Staging" "0. Release\Files to Add to assetsfb.wad"
)
rmdir /s /q "0. Staging"
goto end

:finalizePC
REM move back to the main folder
cd ..
REM remove any files that are stored elsewhere
REM for solo build, files need to be moved to the release instead of deleted
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\sounds" "0. Release\sounds"
	robocopy >nul /e /v "0. Staging\textures\comic" "0. Release\textures\comic"
	robocopy >nul /e /v "0. Staging\textures\loading" "0. Release\textures\loading"
	robocopy >nul /e /v "0. Staging\ui\models\characters" "0. Release\ui\models\characters"
) 
rmdir /s /q "0. Staging/sounds"
rmdir /s /q "0. Staging/textures/comic"
rmdir /s /q "0. Staging/textures/loading"
rmdir /s /q "0. Staging/ui/models"
REM move files and clean up
if %modeChoice%==full (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
) else (
	robocopy >nul /e /v "0. Staging" "0. Release"
)
rmdir /s /q "0. Staging"
goto end

:end
echo Transfer Complete
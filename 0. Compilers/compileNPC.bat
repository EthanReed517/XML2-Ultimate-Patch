REM ***********************************
REM * Section 1 - Establish Variables *
REM ***********************************

:consoleChoiceSection
REM get console choice from main compiler script
set "consoleChoice=%~1"
REM if the console choice variable is assigned (not empty), can skip this step and go to the mode choice
if not "%consoleChoice%"=="" goto modeChoiceSection
REM console not selected, main compiler prompt not used, pick console
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

:modeChoiceSection
REM get mode choice from main compiler script
set "modeChoice=%~2"
REM if the mode choice variable is assigned (not empty), can skip this step and go to the mode choice
if not "%modeChoice%"=="" (
	goto section2
)

REM mode not selected, main compiler prompt not used, pick mode
echo.
echo Mode not selected.
if %consoleChoice%==PC (
	echo [1] Full build: builds the character files for the full X2UP.
	echo [2] Solo build: builds the character for individual release.
	CHOICE /C 12 /M "Which build will you use? "
	IF ERRORLEVEL 2 SET modeChoice=solo & goto section2
	IF ERRORLEVEL 1	SET modeChoice=full & goto section2
) else (
	echo [1] Full build: builds the character files for the full X2UP.
	echo [2] Partial build: alternate full release without building the packages.
	echo [3] Solo build: builds the character for individual release.
	CHOICE /C 123 /M "Which build will you use? "
	IF ERRORLEVEL 3 SET modeChoice=solo & goto section2
	IF ERRORLEVEL 2 SET modeChoice=partial & goto section2
	IF ERRORLEVEL 1	SET modeChoice=full & goto section2
)

REM ***************************
REM * Section 2 - Move Assets *
REM ***************************

:section2
REM Begin compiling assets
md "0. Staging"
if %modeChoice%==solo md "0. Release"
robocopy >nul /e /v "1. Base Assets" "0. Staging"
REM proceed based on console selection
if %consoleChoice%==PC (
	robocopy >nul /e /v "2. Default Assets - PC" "0. Staging"
	goto compilePC
) else (
	if %consoleChoice%==XB (
		robocopy >nul /e /v "2. Default Assets - Xbox" "0. Staging"
	) else if %consoleChoice%==GC (
		robocopy >nul /e /v "2. Default Assets - GameCube" "0. Staging"
	) else if %consoleChoice%==PS2 (
		robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
	) else (
		robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
	)
	goto compileConsole
)

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:compileConsole
REM for a solo build, files need to be moved to the release folder before being cleaned up
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\1. Data Entries" "0. Release\1. Data Entries"
	if exist "0. Staging\2. Bonus Features" robocopy >nul /e /v "0. Staging\2. Bonus Features" "0. Release\2. Bonus Features"
	if exist "0. Staging\2. Bonus Loading Screens" robocopy >nul /e /v "0. Staging\2. Bonus Loading Screens" "0. Release\2. Bonus Loading Screens"
	robocopy >nul /e /v "0. Staging\3. No Cel Shade Assets" "0. Release\3. No Cel Shade Assets"
) 
REM delete the unneeded files
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Features" rmdir /s /q "0. Staging\2. Bonus Features"
if exist "0. Staging\2. Bonus Loading Screens" rmdir /s /q "0. Staging\2. Bonus Loading Screens"
rmdir /s /q "0. Staging\3. No Cel Shade Assets"
REM copy compilers
copy >nul "..\..\0. Compilers\enter.vbs" "0. Staging"
copy >nul "..\..\0. Compilers\fbbuilder.bat" "0. Staging"
copy >nul "..\..\0. Compilers\ravenFormatsCompile.bat" "0. Staging"
if %specialCompile%==Y copy >nul %specialCompileName%.bat "0. Staging"
REM for the partial and solo builds, copy the simple compilers to the staging folder
if not %modeChoice%==full (
	md "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName1%.bat" copy >nul "0. Simple Compilers\compile_%npcName1%.bat" "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName2%.bat" copy >nul "0. Simple Compilers\compile_%npcName2%.bat" "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName3%.bat" copy >nul "0. Simple Compilers\compile_%npcName3%.bat" "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName4%.bat" copy >nul "0. Simple Compilers\compile_%npcName4%.bat" "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName5%.bat" copy >nul "0. Simple Compilers\compile_%npcName5%.bat" "0. Staging\0. Compilers\2. NPCs"
	if exist "0. Simple Compilers\compile_%npcName6%.bat" copy >nul "0. Simple Compilers\compile_%npcName6%.bat" "0. Staging\0. Compilers\2. NPCs"
)
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM compile data files
cmd /c ravenFormatsCompile.bat
if %modeChoice%==full (
	REM for the full build, need to compile the packages
	if %specialCompile%==N (
		REM this is the standard compiler method
		call fbbuilder.bat
	) else if %specialCompile%==Y (
		REM this is for special cases where a file needs to be skin-specific
		call %specialCompileName%.bat
	)
	REM move packages to proper place
	md "packages\generated\characters"
	for /r %%x in (*.fb) do move >nul "%%x" "packages\generated\characters"
) else (
	REM for solo and partial builds, need to sort the cfg files into the appropriate locations
	md "0. CFG Files\2. NPCs"
	for %%x in (*.cfg) do move >nul "%%x" "0. CFG Files\2. NPCs"
)
goto cleanUp

:compilePC
REM for a solo build, files need to be moved to the release folder before being cleaned up
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\1. Data Entries" "0. Release\1. Data Entries"
	if exist "0. Staging\2. Bonus Features" robocopy >nul /e /v "0. Staging\2. Bonus Features" "0. Release\2. Bonus Features"
	if exist "0. Staging\2. Bonus Loading Screens" robocopy >nul /e /v "0. Staging\2. Bonus Loading Screens" "0. Release\2. Bonus Loading Screens"
) 
REM delete the unneeded files
rmdir /s /q "0. Staging\1. Data Entries"
if exist "0. Staging\2. Bonus Features" rmdir /s /q "0. Staging\2. Bonus Features"
if exist "0. Staging\2. Bonus Loading Screens" rmdir /s /q "0. Staging\2. Bonus Loading Screens"

REM read the list of unneeded PC files and delete them
for /f "delims=" %%f in (PCunmodified.cfg) do del /Q "0. Staging\%%f"

REM copy compilers
copy >nul "..\..\0. Compilers\ravenFormatsCompile.bat" "0. Staging"
REM change directory to 0. Staging folder and execute scripts
cd "%~dp0\0. Staging"
REM create packages and compile data files
cmd /c ravenFormatsCompile.bat
REM move packages back to the correct place
goto cleanUp

:cleanUp
del /s >nul *.json
REM clean up extra stuff
if %consoleChoice%==PC (
	del >nul *.cfg
	del >nul packageCreate.py
) else if %modeChoice%==full (
	del >nul *.cfg
)
if not %consoleChoice%==PC (
	del >nul enter.vbs
	del >nul fbbuilder.bat
)
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
	rmdir /s /q "0. Staging/sounds"
	rmdir /s /q "0. Staging/textures"
	rmdir /s /q "0. Staging/ui"
	if exist "0. Staging/data/entities" rmdir /s /q "0. Staging/data/entities"
	if exist "0. Staging/data/fightstyles" rmdir /s /q "0. Staging/data/fightstyles"
	if exist "0. Staging/models" rmdir /s /q "0. Staging/models"
)
REM move files and clean up
if %modeChoice%==full robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\Files to Add to assetsfb.wad"
if %modeChoice%==partial robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
if %modeChoice%==solo robocopy >nul /e /v "0. Staging" "0. Release"
rmdir /s /q "0. Staging"
goto end

:finalizePC
REM move back to the main folder
cd ..
REM remove any files that are stored elsewhere
REM for solo build, files need to be moved to the release instead of deleted
if %modeChoice%==solo (
	robocopy >nul /e /v "0. Staging\sounds" "0. Release\sounds"
	robocopy >nul /e /v "0. Staging\textures\loading" "0. Release\textures\loading"
) 
if exist "0. Staging/sounds" rmdir /s /q "0. Staging/sounds"
if exist "0. Staging/sounds" rmdir /s /q "0. Staging/textures/loading"
REM move files and clean up
if %modeChoice%==full (
	robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files"
) else (
	robocopy >nul /e /v "0. Staging" "0. Release"
)
rmdir /s /q "0. Staging"
goto end

:end
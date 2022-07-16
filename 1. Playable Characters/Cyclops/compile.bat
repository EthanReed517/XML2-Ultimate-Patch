@echo off
echo Compiling Cyclops's character assets 
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
echo [1] GameCube
echo [2] PlayStation 2
echo [3] PlayStation Portable (PSP)
echo [4] Xbox
set /p "consoleChoice=Which console are you using? [1,2,3,4] "
REM Checks if console was selected from main compiler script/if main compiler script was used
:consoleChoiceCheck
if "%consoleChoice%"=="" goto :consoleChoicePrompt

REM get skin pack choice from main compiler script
set "skinPackChoice=%~2"
goto :skinPackChoiceCheck
REM skin pack not selected, main compiler prompt not used, pick skin pack
:skinPackChoicePrompt
echo.
echo Skin pack not selected.
echo [1] Default skin pack
echo [2] Redesign skin pack
echo [3] Custom skin pack
set /p "skinPackChoice=Which skin pack will you be using? [1,2,3] "
REM Checks if skin pack was selected from main compiler script/if main compiler script was used
:skinPackChoiceCheck
if "%skinPackChoice%"=="" goto :skinPackChoicePrompt

REM get cel shading choice from main compiler script 
set "celChoice=%~3"
goto :celChoiceCheck
REM cel shading option not selected, main compiler prompt not used, pick cel shading option
:celChoicePrompt
set /p "celChoice=Will you be using skins with cel shading? (Option will be ignored for PSP) [Y/N] "
REM Checks if cel shading choice was selected from main compiler script/if main compiler script was used
:celChoiceCheck
if "%celChoice%"=="" goto :celChoicePrompt

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
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - GameCube" "0. Staging"
if %celChoice%==N (
	robocopy >nul /e /v "2. Default Assets - GameCube\3. No Cel Shade Assets" "0. Staging"
)
if %skinPackChoice%==2 (
	robocopy >nul /e /v "3. Redesign Assets - GameCube" "0. Staging"
)
if %skinPackChoice%==3 (
	robocopy >nul /e /v "4. Custom Assets - GameCube" "0. Staging"
	if %celChoice%==N (
		robocopy >nul /e /v "4. Custom Assets - GameCube\3. No Cel Shade Assets" "0. Staging"
	)
)
goto :end

REM PS2 options
:compilePS2
REM default assets are included regardless of skin pack choice
robocopy >nul /e /v "2. Default Assets - PS2" "0. Staging"
if %celChoice%==N (
	robocopy >nul /e /v "2. Default Assets - PS2\3. No Cel Shade Assets" "0. Staging"
)
if %skinPackChoice%==2 (
	robocopy >nul /e /v "3. Redesign Assets - PS2" "0. Staging"
)
if %skinPackChoice%==3 (
	robocopy >nul /e /v "4. Custom Assets - PS2" "0. Staging"
	if %celChoice%==N (
		robocopy >nul /e /v "4. Custom Assets - PS2\3. No Cel Shade Assets" "0. Staging"
	)
)
goto :end

REM PSP options
:compilePSP
REM default assets are included regardless of skin pack choice
REM PSP does not use cel shading, so the cel shading option is ignored
robocopy >nul /e /v "2. Default Assets - PSP" "0. Staging"
if %skinPackChoice%==2 (
	robocopy >nul /e /v "3. Redesign Assets - PSP" "0. Staging"
)
if %skinPackChoice%==3 (
	robocopy >nul /e /v "4. Custom Assets - PSP" "0. Staging"
)
goto :end

REM xbox options
:compileXbox
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
goto :end

REM ******************************
REM * Section 3 - Compile Assets *
REM ******************************

:end
REM can remove "3. No Cel Shade Assets" folder from "0. Staging" folder because it's not needed.
rmdir /s /q "0. Staging\3. No Cel Shade Assets"
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
robocopy >nul /e /v "0. Staging" "..\..\0. Ready Files\packages\generated\characters"
rmdir /s /q "0. Staging"
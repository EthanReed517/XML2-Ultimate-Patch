@ECHO OFF

REM bypass the options to create non-default skin packs
set bypass=1

md "1. Base Assets"
goto PC

:PC
CHOICE /C YN /M "Create PC folder? "
IF ERRORLEVEL 2 set PC=N & goto GC
IF ERRORLEVEL 1 (
	set PC=Y
	md "2. Default Assets - PC"
	goto GC
)

:GC
CHOICE /C YN /M "Create GameCube folder? "
IF ERRORLEVEL 2 set GC=N & goto PS2
IF ERRORLEVEL 1 (
	set GC=Y
	md "2. Default Assets - GameCube"
	goto PS2
)

:PS2
CHOICE /C YN /M "Create PS2 folder? "
IF ERRORLEVEL 2 set PS2=N & goto PSP
IF ERRORLEVEL 1 (
	set PS2=Y
	md "2. Default Assets - PS2"
	goto PSP
)

:PSP
CHOICE /C YN /M "Create PSP folder? "
IF ERRORLEVEL 2 set PSP=N & goto Xbox
IF ERRORLEVEL 1 (
	set PSP=Y
	md "2. Default Assets - PSP"
	goto Xbox
)

:Xbox
CHOICE /C YN /M "Create Xbox folder? "
IF ERRORLEVEL 2 set Xbox=N & goto redesign
IF ERRORLEVEL 1 (
	set Xbox=Y
	md "2. Default Assets - Xbox"
	goto redesign
)

:Redesign
if %bypass%==1 goto end
CHOICE /C YN /M "Create folders for redesign skin pack? "
IF ERRORLEVEL 2 goto custom
IF ERRORLEVEL 1 (
	if %GC%==Y md "3. Redesign Assets - GameCube"
	if %PS2%==Y md "3. Redesign Assets - PS2"
	if %PSP%==Y md "3. Redesign Assets - PSP"
	if %Xbox%==Y md "3. Redesign Assets - Xbox"
	goto custom
)

:Custom
CHOICE /C YN /M "Create folders for Custom skin pack? "
IF ERRORLEVEL 2 goto end
IF ERRORLEVEL 1 (
	if %GC%==Y md "4. Custom Assets - GameCube"
	if %PS2%==Y md "4. Custom Assets - PS2"
	if %PSP%==Y md "4. Custom Assets - PSP"
	if %Xbox%==Y md "4. Custom Assets - Xbox"
	goto end
)

:end
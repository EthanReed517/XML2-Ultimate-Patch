@ECHO OFF

set /P GC=Create GameCube folders? [Y/N]
set /P PSP=Create PSP folders? [Y/N]
set /P Redesign=Create folders for redesign skin packs? [Y/N]
set /P CustomC=Create folders for custom skin packs? [Y/N]

md "1. Base Assets"
if %GC%==Y md "2. Default Assets - GameCube"
md "2. Default Assets - PS2"
if %PSP%==Y md "2. Default Assets - PSP"
md "2. Default Assets - Xbox"
if %Redesign%==Y (
	if %GC%==Y md "3. Redesign Assets - GameCube"
	md "3. Redesign Assets - PS2"
	if %PSP%==Y md "3. Redesign Assets - PSP"
	md "3. Redesign Assets - Xbox"
)
if %Custom%==Y (
	if %GC%==Y md "4. Custom Assets - GameCube"
	md "4. Custom Assets - PS2"
	if %PSP%==Y md "4. Custom Assets - PSP"
	md "4. Custom Assets - Xbox"
)
REM section for map stuff
Setlocal EnableDelayedExpansion
for /f "delims=" %%f in (updateMaps.cfg) do (
	set line=%%f
	if "!line:~0,1!"=="#" (
		REM a line that starts with "#" is a comment and can be ignored
		echo.
	) else if "!line:~0,1!"=="^" (
		REM lines in the file that represent the map path start with a "^". Set that as the path when it appears
		set mapPath=..\..\5. Maps\!line:~1!
	) else (
		REM if it's not a line that represents the map path, it's a file that needs to be copied
		copy "!line!" "!mapPath!\!line!"
	)
)
endlocal

REM section for data entries
echo Copying data entries to data files...
set destination=..\..\3. General Data Files
if not %codexEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Codex_%codexEntry%.json" "%destination%\codex\1. Base Assets\0. Codex Entries\%codexEntry%.json"
)
if not %npcstatEntry1%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry1%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry1%.json"
)
if not %npcstatEntry2%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry2%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry2%.json"
)
if not %npcstatEntry3%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry3%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry3%.json"
)
if not %npcstatEntry4%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry4%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry4%.json"
)
if not %npcstatEntry5%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry5%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry5%.json"
)
if not %npcstatEntry6%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry6%.json" "%destination%\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry6%.json"
)
if not %reviewEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\ReviewPaths_%reviewEntry%.json" "%destination%\review_paths\1. Base Assets\0. Review_Paths Entries\%reviewEntry%.json"
)

REM section for other files
REM files that exist in base assets
echo Copying additional files...
REM loading screens
set destination=..\..\4. Menus\Loading Screens
if exist "1. Base Assets\textures\loading" (
	robocopy >nul /e /v "1. Base Assets\textures\loading" "%destination%\1. Base Assets\textures\loading"
)
if exist "1. Base Assets\2. Bonus Loading Screens" (
	robocopy >nul /e /v "1. Base Assets\2. Bonus Loading Screens" "%destination%\1. Base Assets\2. Bonus Loading Screens"
)
if exist "2. Default Assets - GameCube\textures\loading" (
	robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "%destination%\2. Default Assets - GameCube\textures\loading"
)
if exist "2. Default Assets - GameCube\2. Bonus Loading Screens" (
	robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Loading Screens" "%destination%\2. Default Assets - GameCube\2. Bonus Loading Screens"
)
if exist "2. Default Assets - PS2\textures\loading" (
	robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "%destination%\2. Default Assets - PS2\textures\loading"
)
if exist "2. Default Assets - PS2\2. Bonus Loading Screens" (
	robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Loading Screens" "%destination%\2. Default Assets - PS2\2. Bonus Loading Screens"
)
if exist "2. Default Assets - PSP\textures\loading" (
	robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "%destination%\2. Default Assets - PSP\textures\loading"
)
if exist "2. Default Assets - PSP\2. Bonus Loading Screens" (
	robocopy >nul /e /v "2. Default Assets - PSP\2. Bonus Loading Screens" "%destination%\2. Default Assets - PSP\2. Bonus Loading Screens"
)
REM sounds
set destination=..\..\8. Sounds
if exist "2. Default Assets - GameCube\sounds" (
	robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "%destination%\2. Default Assets - GameCube\sounds"
)
if exist "2. Default Assets - PC\sounds" (
	robocopy >nul /e /v "2. Default Assets - PC\sounds" "%destination%\2. Default Assets - PC\sounds"
)
if exist "2. Default Assets - PS2\sounds" (
	robocopy >nul /e /v "2. Default Assets - PS2\sounds" "%destination%\2. Default Assets - PS2\sounds"
)
if exist "2. Default Assets - PSP\sounds" (
	robocopy >nul /e /v "2. Default Assets - PSP\sounds" "%destination%\2. Default Assets - PSP\sounds"
)
if exist "2. Default Assets - Xbox\sounds" (
	robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "%destination%\2. Default Assets - Xbox\sounds"
)
REM bonus features
set destination=..\..\7. Bonus Features
if exist "1. Base Assets\2. Bonus Features" (
	robocopy >nul /e /v "1. Base Assets\2. Bonus Features" "%destination%\1. Base Assets\2. Bonus Features"
)
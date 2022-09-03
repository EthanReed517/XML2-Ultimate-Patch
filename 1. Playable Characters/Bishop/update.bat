@ECHO OFF
REM ***************
REM * User Inputs *
REM ***************
REM Fill in the following variable prompts with the name of the files or leave it as "" if it doesn't apply

REM Data Entry Options
set codexEntry=Bishop
set dangerEntry=Bishop
set herostatEntry=Bishop
set itemsEntry=Bishop
set npcstatEntry1=Bishop_MC
set npcstatEntry2=BishopSimple
set npcstatEntry3=""
set reviewEntry=Bishop

REM Fill in the following variable prompts with either "Y" for "Yes" or "N" for "No"

REM Console options
set PC=Y
set GC=Y
set PS2=Y
set PSP=Y
set XB=Y

REM Additional content options
set bonusComic=N
set bonusFeatures=N
set bonusLoad=N
set pspXml1Comic=N

REM ******************
REM * Code Execution *
REM ******************

REM section for maps. Not yet implemented
echo Copying NPC assets to map folders...
echo (This feature has not been implemented yet. Text is a placeholder)

REM section for data entries
echo Copying data entries to data files...
if not %codexEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Codex_%codexEntry%.json" "..\..\3. General Data Files\codex\1. Base Assets\0. Codex Entries\%codexEntry%.json"
)
if not %dangerEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Dangerroom_%dangerEntry%.json" "..\..\3. General Data Files\dangerroom\1. Base Assets\0. Danger Room Entries\%dangerEntry%.json"
)
if not %herostatEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Herostat_%herostatEntry%.txt" "..\..\3. General Data Files\herostat\1. Base Assets\0. Herostat Entries\%herostatEntry%.txt"
)
if not %itemsEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\Items_%itemsEntry%.json" "..\..\3. General Data Files\items\1. Base Assets\0. Items Entries\%itemsEntry%.json"
)
if not %npcstatEntry1%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry1%.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry1%.json"
)
if not %npcstatEntry2%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry2%.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry2%.json"
)
if not %npcstatEntry3%=="" (
	copy >nul "1. Base Assets\1. Data Entries\NPCstat_%npcstatEntry3%.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\%npcstatEntry3%.json"
)
if not %reviewEntry%=="" (
	copy >nul "1. Base Assets\1. Data Entries\ReviewPaths_%reviewEntry%.json" "..\..\3. General Data Files\review_paths\1. Base Assets\0. Review_Paths Entries\%reviewEntry%.json"
)

REM section for other files
REM files that exist in base assets
echo Copying additional files...
robocopy >nul /e /v "1. Base Assets\ui\models\characters" "..\..\4. Menus\Character Select Screen\1. Base Assets\ui\models\characters"
robocopy >nul /e /v "1. Base Assets\textures\comic" "..\..\4. Menus\Comic Covers\1. Base Assets\textures\comic"
robocopy >nul /e /v "1. Base Assets\textures\loading" "..\..\4. Menus\Loading Screens\1. Base Assets\textures\loading"
if %bonusComic%==Y (
	robocopy >nul /e /v "1. Base Assets\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\1. Base Assets\2. Bonus Comic Covers"
)
if %bonusFeatures%==Y (
	robocopy >nul /e /v "1. Base Assets\2. Bonus Features" "..\..\7. Bonus Features\1. Base Assets\2. Bonus Features"
)
if %bonusLoad%==Y (
	robocopy >nul /e /v "1. Base Assets\2. Bonus Loading Screens" "..\..\4. Menus\Loading Screens\1. Base Assets\2. Bonus Loading Screens"
)
if %pspXml1Comic%==Y (
	robocopy >nul /e /v "1. Base Assets\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Loading Screens\1. Base Assets\2. Comics for XML1 and PSP characters"
)

REM PC-exclusive files
if %PC%==Y (
	robocopy >nul /e /v "2. Default Assets - PC\sounds" "..\..\8. Sounds\2. Default Assets - PC\sounds"
)

REM GC-exclusive files
if %GC%==Y (
	robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "..\..\8. Sounds\2. Default Assets - GameCube\sounds"
	robocopy >nul /e /v "2. Default Assets - GameCube\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\textures\comic"
	robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\textures\loading"
	if %bonusComic%==Y (
		robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\2. Bonus Comic Covers"
	)
	if %bonusFeatures%==Y (
		robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Features" "..\..\7. Bonus Features\2. Default Assets - GameCube\2. Bonus Features"
	)
	if %bonusLoad%==Y (
		robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Loading Screens" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\2. Bonus Loading Screens"
	)
	if %pspXml1Comic%==Y (
		robocopy >nul /e /v "2. Default Assets - GameCube\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\2. Comics for XML1 and PSP characters"
	)
)

REM PS2-exclusive files
if %PS2%==Y (
	robocopy >nul /e /v "2. Default Assets - PS2\sounds" "..\..\8. Sounds\2. Default Assets - PS2\sounds"
	robocopy >nul /e /v "2. Default Assets - PS2\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\textures\comic"
	robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\textures\loading"
	if %bonusComic%==Y (
		robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\2. Bonus Comic Covers"
	)
	if %bonusFeatures%==Y (
		robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Features" "..\..\7. Bonus Features\2. Default Assets - PS2\2. Bonus Features"
	)
	if %bonusLoad%==Y (
		robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Loading Screens" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\2. Bonus Loading Screens"
	)
	if %pspXml1Comic%==Y (
		robocopy >nul /e /v "2. Default Assets - PS2\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\2. Comics for XML1 and PSP characters"
	)
)

REM PSP-exclusive files
if %PSP%==Y (
	robocopy >nul /e /v "2. Default Assets - PSP\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - PSP\ui\models\characters"
	robocopy >nul /e /v "2. Default Assets - PSP\sounds" "..\..\8. Sounds\2. Default Assets - PSP\sounds"
	robocopy >nul /e /v "2. Default Assets - PSP\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PSP\textures\comic"
	robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\textures\loading"
	if %bonusComic%==Y (
		robocopy >nul /e /v "2. Default Assets - PSP\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\2. Default Assets - PSP\2. Bonus Comic Covers"
	)
	if %bonusFeatures%==Y (
		robocopy >nul /e /v "2. Default Assets - PSP\2. Bonus Features" "..\..\7. Bonus Features\2. Default Assets - PSP\2. Bonus Features"
	)
	if %bonusLoad%==Y (
		robocopy >nul /e /v "2. Default Assets - PSP\2. Bonus Loading Screens" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\2. Bonus Loading Screens"
	)
	if %pspXml1Comic%==Y (
		robocopy >nul /e /v "2. Default Assets - PSP\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\2. Comics for XML1 and PSP characters"
	)
)

REM Xbox-exclusive files
if %XB%==Y (
	robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "..\..\8. Sounds\2. Default Assets - Xbox\sounds"
	if %bonusFeatures%==Y (
		robocopy >nul /e /v "2. Default Assets - Xbox\2. Bonus Features" "..\..\7. Bonus Features\2. Default Assets - Xbox\2. Bonus Features"
	)
)
@ECHO OFF

echo Copying NPC assets to map folders...
echo (This feature has not been implemented yet. Text is a placeholder)

REM data entries
echo Copying data entries to data files...
copy >nul "1. Base Assets\1. Data Entries\Codex_Archangel.json" "..\..\3. General Data Files\codex\1. Base Assets\0. Codex Entries\Archangel.json"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_Archangel.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\Archangel.json"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_Angel.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\Angel.json"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_ApocArchangel.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\ApocArchangel.json"
copy >nul "1. Base Assets\1. Data Entries\ReviewPaths_Archangel.json" "..\..\3. General Data Files\review_paths\1. Base Assets\0. Review_Paths Entries\Archangel.json"

REM loading screens
echo Copying loading screens to the loading folder...
robocopy >nul /e /v "1. Base Assets\textures\loading" "..\..\4. Menus\Loading Screens\1. Base Assets\textures\loading"
robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\textures\loading"
robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\textures\loading"
robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\textures\loading"

REM sounds
echo Copying sounds to the sounds folder...
robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "..\..\7. Sounds\2. Default Assets - GameCube\sounds"
robocopy >nul /e /v "2. Default Assets - PC\sounds" "..\..\7. Sounds\2. Default Assets - PC\sounds"
robocopy >nul /e /v "2. Default Assets - PS2\sounds" "..\..\7. Sounds\2. Default Assets - PS2\sounds"
robocopy >nul /e /v "2. Default Assets - PSP\sounds" "..\..\7. Sounds\2. Default Assets - PSP\sounds"
robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "..\..\7. Sounds\2. Default Assets - Xbox\sounds"
@ECHO OFF

echo Copying NPC assets to map folders...
echo (This feature has not been implemented yet. Text is a placeholder)

REM data entries
echo Copying data entries to data files...
copy >nul "1. Base Assets\1. Data Entries\Codex_Beast.json" "..\..\3. General Data Files\codex\1. Base Assets\0. Codex Entries\Beast.json"
copy >nul "1. Base Assets\1. Data Entries\Herostat_Beast.txt" "..\..\3. General Data Files\herostat\1. Base Assets\0. Herostat Entries\Beast.txt"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_Beast.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\Beast.json"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_BeastBoss.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\BeastBoss.json"
copy >nul "1. Base Assets\1. Data Entries\ReviewPaths_Beast.json" "..\..\3. General Data Files\review_paths\1. Base Assets\0. Review_Paths Entries\Beast.json"

REM Character Select Portraits
echo Copying Character Select Portraits to the character select menu...
robocopy >nul /e /v "1. Base Assets\ui\models\characters" "..\..\4. Menus\Character Select Screen\1. Base Assets\ui\models\characters"
robocopy >nul /e /v "2. Default Assets - PSP\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - PSP\ui\models\characters"

REM loading screens
echo Copying loading screens to the loading folder...
robocopy >nul /e /v "1. Base Assets\textures\loading" "..\..\4. Menus\Loading Screens\1. Base Assets\textures\loading"
robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\textures\loading"
robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\textures\loading"
robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\textures\loading"

REM comic covers
echo Copying comic book cover to the comic covers folder...
robocopy >nul /e /v "1. Base Assets\textures\comic" "..\..\4. Menus\Comic Covers\1. Base Assets\textures\comic"
robocopy >nul /e /v "1. Base Assets\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Comic Covers\1. Base Assets\2. Comics for XML1 and PSP characters"
robocopy >nul /e /v "2. Default Assets - GameCube\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\textures\comic"
robocopy >nul /e /v "2. Default Assets - GameCube\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\2. Comics for XML1 and PSP characters"
robocopy >nul /e /v "2. Default Assets - PS2\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\textures\comic"
robocopy >nul /e /v "2. Default Assets - PS2\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\2. Comics for XML1 and PSP characters"
robocopy >nul /e /v "2. Default Assets - PSp\2. Comics for XML1 and PSP characters" "..\..\4. Menus\Comic Covers\2. Default Assets - PSP\2. Comics for XML1 and PSP characters"

REM sounds
echo Copying sounds to the sounds folder...
robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "..\..\7. Sounds\2. Default Assets - GameCube\sounds"
robocopy >nul /e /v "2. Default Assets - PC\sounds" "..\..\7. Sounds\2. Default Assets - PC\sounds"
robocopy >nul /e /v "2. Default Assets - PS2\sounds" "..\..\7. Sounds\2. Default Assets - PS2\sounds"
robocopy >nul /e /v "2. Default Assets - PSP\sounds" "..\..\7. Sounds\2. Default Assets - PSP\sounds"
robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "..\..\7. Sounds\2. Default Assets - Xbox\sounds"
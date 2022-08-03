@ECHO OFF

echo Copying NPC assets to map folders...
echo (This feature has not been implemented yet. Text is a placeholder)

echo Copying data entries to data files...
copy >nul "1. Base Assets\1. Data Entries\Codex_Magneto.json" "..\..\3. General Data Files\codex\1. Base Assets\0. Codex Entries\Magneto.json"
copy >nul "1. Base Assets\1. Data Entries\Dangerroom_Magneto.json" "..\..\3. General Data Files\dangerroom\1. Base Assets\0. Danger Room Entries\Magneto.json"
copy >nul "1. Base Assets\1. Data Entries\Herostat_Magneto.txt" "..\..\3. General Data Files\herostat\1. Base Assets\0. Herostat Entries\Magneto.txt"
copy >nul "1. Base Assets\1. Data Entries\Items_Magneto.json" "..\..\3. General Data Files\items\1. Base Assets\0. Items Entries\Magneto.json"
copy >nul "1. Base Assets\1. Data Entries\NPCstat_MagnetoSimple.json" "..\..\3. General Data Files\npcstat\1. Base Assets\0. NPCstat Entries\MagnetoSimple.json"

echo Copying Character Select Portraits to the character select menu...
robocopy >nul /e /v "1. Base Assets\ui\models\characters" "..\..\4. Menus\Character Select Screen\1. Base Assets\ui\models\characters"
robocopy >nul /e /v "2. Default Assets - PSP\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - PSP\ui\models\characters"

echo Copying loading screens to the loading folder...
robocopy >nul /e /v "1. Base Assets\textures\loading" "..\..\4. Menus\Loading Screens\1. Base Assets\textures\loading"
robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\textures\loading"
robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\textures\loading"
robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\textures\loading"

echo Copying comic book cover to the comic covers folder...
robocopy >nul /e /v "1. Base Assets\textures\comic" "..\..\4. Menus\Comic Covers\1. Base Assets\textures\comic"
robocopy >nul /e /v "1. Base Assets\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\1. Base Assets\2. Bonus Comic Covers"
robocopy >nul /e /v "2. Default Assets - GameCube\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\textures\comic"
robocopy >nul /e /v "2. Default Assets - GameCube\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\2. Bonus Comic Covers"
robocopy >nul /e /v "2. Default Assets - PS2\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\textures\comic"
robocopy >nul /e /v "2. Default Assets - PS2\2. Bonus Comic Covers" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\2. Bonus Comic Covers"
robocopy >nul /e /v "2. Default Assets - PSP\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PSP\textures\comic"

echo Copying sounds to the sounds folder...
robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "..\..\7. Sounds\2. Default Assets - GameCube\sounds"
robocopy >nul /e /v "2. Default Assets - PC\sounds" "..\..\7. Sounds\2. Default Assets - PC\sounds"
robocopy >nul /e /v "2. Default Assets - PS2\sounds" "..\..\7. Sounds\2. Default Assets - PS2\sounds"
robocopy >nul /e /v "2. Default Assets - PSP\sounds" "..\..\7. Sounds\2. Default Assets - PSP\sounds"
robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "..\..\7. Sounds\2. Default Assets - Xbox\sounds"
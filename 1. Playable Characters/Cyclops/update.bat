@ECHO OFF

echo Copying NPC assets to map folders...
echo (This feature has not been implemented yet. Text is a placeholder)

echo Copying Character Select Portraits to the character select menu...
robocopy >nul /e /v "2. Default Assets - GameCube\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - GameCube\ui\models\characters"
robocopy >nul /e /v "2. Default Assets - PS2\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - PS2\ui\models\characters"
robocopy >nul /e /v "2. Default Assets - PSP\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - PSP\ui\models\characters"
robocopy >nul /e /v "2. Default Assets - Xbox\ui\models\characters" "..\..\4. Menus\Character Select Screen\2. Default Assets - Xbox\ui\models\characters"

echo Copying loading screens to the loading folder...
robocopy >nul /e /v "2. Default Assets - GameCube\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - GameCube\textures\loading"
robocopy >nul /e /v "2. Default Assets - PS2\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PS2\textures\loading"
robocopy >nul /e /v "2. Default Assets - PSP\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - PSP\textures\loading"
robocopy >nul /e /v "2. Default Assets - Xbox\textures\loading" "..\..\4. Menus\Loading Screens\2. Default Assets - Xbox\textures\loading"

echo Copying comic book cover to the comic covers folder...
robocopy >nul /e /v "2. Default Assets - GameCube\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - GameCube\textures\comic"
robocopy >nul /e /v "2. Default Assets - PS2\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PS2\textures\comic"
robocopy >nul /e /v "2. Default Assets - PSP\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - PSP\textures\comic"
robocopy >nul /e /v "2. Default Assets - Xbox\textures\comic" "..\..\4. Menus\Comic Covers\2. Default Assets - Xbox\textures\comic"

echo Copying sounds to the sounds folder...
robocopy >nul /e /v "2. Default Assets - GameCube\sounds" "..\..\7. Sounds\2. Default Assets - GameCube\sounds"
robocopy >nul /e /v "2. Default Assets - PS2\sounds" "..\..\7. Sounds\2. Default Assets - PS2\sounds"
robocopy >nul /e /v "2. Default Assets - PSP\sounds" "..\..\7. Sounds\2. Default Assets - PSP\sounds"
robocopy >nul /e /v "2. Default Assets - Xbox\sounds" "..\..\7. Sounds\2. Default Assets - Xbox\sounds"
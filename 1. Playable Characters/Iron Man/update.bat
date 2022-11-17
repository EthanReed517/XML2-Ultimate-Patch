@ECHO OFF

REM **********************
REM * Pre-Defined Values *
REM **********************
REM These values will help shorten file paths
:fileDef
set BaseFolder=1. Base Assets
set dataFolder=1. Data Entries
set GCFolder=2. Default Assets - GameCube
set PCFolder=2. Default Assets - PC
set PS2Folder=2. Default Assets - PS2
set PSPFolder=2. Default Assets - PSP
set XBFolder=2. Default Assets - Xbox
set NoCelFolder=3. No Cel Shade Assets

REM ***************
REM * User Inputs *
REM ***************
REM Fill in the following variable prompts with the name of the files or leave it as "" if it doesn't apply

REM Data Entry Options
set codexEntry=IronMan
set dangerEntry=""
set herostatEntry=IronMan
set itemsEntry=""
set npcstatEntry1=IronManSimple
set npcstatEntry2=TonyStark
set npcstatEntry3=""
set npcstatEntry4=""
set npcstatEntry5=""
set npcstatEntry6=""
set reviewEntry=IronMan

REM ******************
REM * Code Execution *
REM ******************

REM section for maps. Not yet implemented
echo Copying NPC assets to map folders...
echo act0\tutorial\tutorial1
set mapPath=..\..\5. Maps\actX\X\X
copy >nul "%BaseFolder%\%NoCelFolder%\actors\XX01.igb" "%mapPath%\%BaseFolder%\%NoCelFolder%\actors"
copy >nul "%BaseFolder%\actors\XX01.igb" "%mapPath%\%BaseFolder%\actors"
copy >nul "%BaseFolder%\hud\hud_head_XX01.igb" "%mapPath%\%BaseFolder%\hud"
copy >nul "%GCFolder%\%NoCelFolder%\actors\XX01.igb" "%mapPath%\%GCFolder%\%NoCelFolder%\actors"
copy >nul "%GCFolder%\actors\XX01.igb" "%mapPath%\%GCFolder%\actors"
copy >nul "%PSPFolder%\actors\XX01.igb" "%mapPath%\%PSPFolder%\actors"
copy >nul "%PSPFolder%\hud\hud_head_XX01.igb" "%mapPath%\%PSPFolder%\hud"

REM *********************************************
REM * LINES BELOW HERE DO NOT NEED TO BE EDITED *
REM *********************************************
REM Everything below is fully automated

REM section for data entries
echo Copying data entries to data files...
set destination=..\..\3. General Data Files
if not %codexEntry%=="" (
	copy >nul "%baseFolder%\%dataFolder%\Codex_%codexEntry%.json" "%destination%\codex\%baseFolder%\0. Codex Entries\%codexEntry%.json"
)
if not %dangerEntry%=="" (
	copy >nul "%baseFolder%\%dataFolder%\Dangerroom_%dangerEntry%.json" "%destination%\dangerroom\%baseFolder%\0. Danger Room Entries\%dangerEntry%.json"
)
if not %herostatEntry%=="" (
	copy >nul "%baseFolder%\%dataFolder%\Herostat_%herostatEntry%.txt" "%destination%\herostat\%baseFolder%\0. Herostat Entries\%herostatEntry%.txt"
)
if not %itemsEntry%=="" (
	copy >nul "%baseFolder%\%dataFolder%\Items_%itemsEntry%.json" "%destination%\items\%baseFolder%\0. Items Entries\%itemsEntry%.json"
)
if not %npcstatEntry1%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry1%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry1%.json"
)
if not %npcstatEntry2%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry2%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry2%.json"
)
if not %npcstatEntry3%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry3%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry3%.json"
)
if not %npcstatEntry4%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry4%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry4%.json"
)
if not %npcstatEntry5%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry5%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry5%.json"
)
if not %npcstatEntry6%=="" (
	copy >nul "%baseFolder%\%dataFolder%\NPCstat_%npcstatEntry6%.json" "%destination%\npcstat\%baseFolder%\0. NPCstat Entries\%npcstatEntry6%.json"
)
if not %reviewEntry%=="" (
	copy >nul "%baseFolder%\%dataFolder%\ReviewPaths_%reviewEntry%.json" "%destination%\review_paths\%baseFolder%\0. Review_Paths Entries\%reviewEntry%.json"
)

REM section for other files
REM files that exist in base assets
echo Copying additional files...
REM character select portrait
set destination=..\..\4. Menus\Character Select Screen
robocopy >nul /e /v "%baseFolder%\ui\models\characters" "%destination%\%baseFolder%\ui\models\characters"
if exist "%PSPFolder%" (
	robocopy >nul /e /v "%PSPFolder%\ui\models\characters" "%destination%\%PSPFolder%\ui\models\characters"
)
REM comic covers
set destination=..\..\4. Menus\Comic Covers
if exist "%baseFolder%\textures\comic" (
	robocopy >nul /e /v "%baseFolder%\textures\comic" "%destination%\%baseFolder%\textures\comic"
)
if exist "%baseFolder%\2. Bonus Comic Covers" (
	robocopy >nul /e /v "%baseFolder%\2. Bonus Comic Covers" "%destination%\%baseFolder%\2. Bonus Comic Covers"
)
if exist "%baseFolder%\2. Comics for XML1 and PSP characters" (
	robocopy >nul /e /v "%baseFolder%\2. Comics for XML1 and PSP characters" "%destination%\%baseFolder%\2. Comics for XML1 and PSP characters"
)
if exist "%GCFolder%\textures\comic" (
	robocopy >nul /e /v "%GCFolder%\textures\comic" "%destination%\%GCFolder%\textures\comic"
)
if exist "%GCFolder%\2. Bonus Comic Covers" (
	robocopy >nul /e /v "%GCFolder%\2. Bonus Comic Covers" "%destination%\%GCFolder%\2. Bonus Comic Covers"
)
if exist "%GCFolder%\2. Comics for XML1 and PSP characters" (
	robocopy >nul /e /v "%GCFolder%\2. Comics for XML1 and PSP characters" "%destination%\%GCFolder%\2. Comics for XML1 and PSP characters"
)
if exist "%PS2Folder%\textures\comic" (
	robocopy >nul /e /v "%PS2Folder%\textures\comic" "%destination%\%PS2Folder%\textures\comic"
)
if exist "%PS2Folder%\2. Bonus Comic Covers" (
	robocopy >nul /e /v "%PS2Folder%\2. Bonus Comic Covers" "%destination%\%PS2Folder%\2. Bonus Comic Covers"
)
if exist "%PS2Folder%\2. Comics for XML1 and PSP characters" (
	robocopy >nul /e /v "%PS2Folder%\2. Comics for XML1 and PSP characters" "%destination%\%PS2Folder%\2. Comics for XML1 and PSP characters"
)
if exist "%PSPFolder%\textures\comic" (
	robocopy >nul /e /v "%PSPFolder%\textures\comic" "%destination%\%PSPFolder%\textures\comic"
)
if exist "%PSPFolder%\2. Bonus Comic Covers" (
	robocopy >nul /e /v "%PSPFolder%\2. Bonus Comic Covers" "%destination%\%PSPFolder%\2. Bonus Comic Covers"
)
if exist "%PSPFolder%\2. Comics for XML1 and PSP characters" (
	robocopy >nul /e /v "%PSPFolder%\2. Comics for XML1 and PSP characters" "%destination%\%PSPFolder%\2. Comics for XML1 and PSP characters"
)
REM loading screens
set destination=..\..\4. Menus\Loading Screens
if exist "%baseFolder%\textures\loading" (
	robocopy >nul /e /v "%baseFolder%\textures\loading" "%destination%\%baseFolder%\textures\loading"
)
if exist "%baseFolder%\2. Bonus Loading Screens" (
	robocopy >nul /e /v "%baseFolder%\2. Bonus Loading Screens" "%destination%\%baseFolder%\2. Bonus Loading Screens"
)
if exist "%GCFolder%\textures\loading" (
	robocopy >nul /e /v "%GCFolder%\textures\loading" "%destination%\%GCFolder%\textures\loading"
)
if exist "%GCFolder%\2. Bonus Loading Screens" (
	robocopy >nul /e /v "%GCFolder%\2. Bonus Loading Screens" "%destination%\%GCFolder%\2. Bonus Loading Screens"
)
if exist "%PS2Folder%\textures\loading" (
	robocopy >nul /e /v "%PS2Folder%\textures\loading" "%destination%\%PS2Folder%\textures\loading"
)
if exist "%PS2Folder%\2. Bonus Loading Screens" (
	robocopy >nul /e /v "%PS2Folder%\2. Bonus Loading Screens" "%destination%\%PS2Folder%\2. Bonus Loading Screens"
)
if exist "%PSPFolder%\textures\loading" (
	robocopy >nul /e /v "%PSPFolder%\textures\loading" "%destination%\%PSPFolder%\textures\loading"
)
if exist "%PSPFolder%\2. Bonus Loading Screens" (
	robocopy >nul /e /v "%PSPFolder%\2. Bonus Loading Screens" "%destination%\%PSPFolder%\2. Bonus Loading Screens"
)
REM sounds
set destination=..\..\8. Sounds
if exist "%GCFolder%\sounds" (
	robocopy >nul /e /v "%GCFolder%\sounds" "%destination%\%GCFolder%\sounds"
)
if exist "%PCFolder%\sounds" (
	robocopy >nul /e /v "%PCFolder%\sounds" "%destination%\%PCFolder%\sounds"
)
if exist "%PS2Folder%\sounds" (
	robocopy >nul /e /v "%PS2Folder%\sounds" "%destination%\%PS2Folder%\sounds"
)
if exist "%PSPFolder%\sounds" (
	robocopy >nul /e /v "%PSPFolder%\sounds" "%destination%\%PSPFolder%\sounds"
)
if exist "%XBFolder%\sounds" (
	robocopy >nul /e /v "%XBFolder%\sounds" "%destination%\%XBFolder%\sounds"
)
REM bonus features
set destination=..\..\7. Bonus Features
if exist "%baseFolder%\2. Bonus Features" (
	robocopy >nul /e /v "%baseFolder%\2. Bonus Features" "%destination%\%baseFolder%\2. Bonus Features"
)
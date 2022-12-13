REM create a folder where the files will go (if it's not already created)
md "0. Complete Files"
REM move into the folder where the cfg files are
cd "%~dp0\0. CFG Files\1. Playable Characters"
REM copy the cfg files out to the main folder
set packageName=%charName%_%charNum%
set xmlPackageName=%charName%_xml
for /r %%x in (%packageName%*) do copy >nul "%%x" "..\.."
if exists %xmlPackageName% copy >nul "%xmlPackageName%.fb.cfg" "..\.."
REM move back out to the main folder
cd ..\..
REM move the compilers into the main folder
copy >nul "0. Compilers\enter.vbs" "%~dp0"
copy >nul "0. Compilers\fbbuilder.bat" "%~dp0"
if exists "0. Compilers\1. Playable Characters\%specialCompileName%.bat" copy >nul "0. Compilers\1. Playable Characters\%specialCompileName%.bat" "%~dp0"
REM build the fb packages
if specialCompile==N (
	call fbbuilder.bat
) else (
	call %specialCompileName%.bat
)	
REM delete the cfg files from the main folder
del >nul *.cfg
REM create a destination for the packages (if one hasn't been made)
md "0. Complete Files\Files to Add to assetsfb.wad\packages\generated\characters"
REM move the fb packages to the correct folder
for /r %%x in (*.fb) do move >nul "%%x" "0. Complete Files\Files to Add to assetsfb.wad\packages\generated\characters"

REM copy additional files
if not %powerstyle%=="" robocopy >nul /e /v "data\powerstyles" "0. Complete Files\Files to Add to assetsfb.wad\data\powerstyles" "%powerstyle%.engb"
if not %effectsFolder%=="" robocopy >nul /e /v "effects\char\%effectsFolder%" "0. Complete Files\Files to Add to assetsfb.wad\effects\char\%effectsFolder%"
if not %soundfile%=="" robocopy >nul /e /v "sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "0. Complete Files\sounds\eng\%soundfile:~0,1%\%soundfile:~1,1%" "%soundfile%.zsm"
if not %comicCover%=="" robocopy >nul /e /v "textures\comic" "0. Complete Files\Files to Add to assetsfb.wad\textures\comic" "%comicCover%.igb"
if not %loadingScreen1%=="" robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen1%.igb"
if not %loadingScreen2%=="" robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen2%.igb"
if not %loadingScreen3%=="" robocopy >nul /e /v "textures\loading" "0. Complete Files\Files to Add to assetsfb.wad\textures\loading" "%loadingScreen3%.igb"

REM delete the compilers 
del >nul enter.vbs
del >nul fbbuilder.bat
if exist %specialCompileName%.bat del >nul %specialCompileName%.bat
echo.
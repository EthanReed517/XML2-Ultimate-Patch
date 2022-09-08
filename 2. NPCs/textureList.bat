@ECHO OFF

REM move the python script to the effects\char folder and go there
copy >nul "..\..\0. Utilities\List Textures Not In Permanent Package\textureList.py" "1. Base Assets\effects\char"
cd "%~dp0\1. Base Assets\effects\char"

REM for the folders in the "char" folder
for /d %%i in (*) do (
	REM move the script from the "char" folder into the sub-folder and go there
	if exist textureList.txt move >nul textureList.txt %%i
	move >nul textureList.py %%i
	cd "%CD%\%%i"
	REM call the python script
	python textureList.py
	REM move the texture list and script back out
	move >nul textureList.txt ..
	move >nul textureList.py ..
	cd ..
)

REM clean up the files and move back to the main folder
del >nul textureList.py
move >nul textureList.txt ..\..\..
cd ..\..\..

REM clear out the existing missing textures list and start the new one
del >nul "Missing Textures.txt"
echo The following textures are missing from the permanent package:>"Missing Textures.txt"

for /f "tokens=*" %%a in (textureList.txt) do (
	if not exist "..\..\3. General Data Files\permanent\2. Default Assets - PS2\textures\%%a" (
		echo %%a>>"Missing Textures.txt"
	)
)
del >nul textureList.txt
echo Check "Missing Textures.txt" for a list of files that are not in the permanent package
pause
@echo off
echo Updating X-Men Legends II files
echo.
echo.
REM 1. Playable Characters
echo Updating playable characters...
echo defaultman
cd "%~dp0\1. Playable Characters\defaultman"
call update.bat 
cd ..\..
echo Cyclops
cd "%~dp0\1. Playable Characters\Cyclops"
call update.bat 
cd ..\..
echo Magneto
cd "%~dp0\1. Playable Characters\Magneto"
call update.bat 
cd ..\..
echo Storm
cd "%~dp0\1. Playable Characters\Storm"
call update.bat 
cd ..\..
echo Wolverine
cd "%~dp0\1. Playable Characters\Wolverine"
call update.bat 
cd ..\..

echo Updating data files...
echo herostat
cd "%~dp0\3. General Data Files\herostat"
call update.bat 
cd ..\..
echo review_paths
cd "%~dp0\3. General Data Files\review_paths"
call update.bat 
cd ..\..
echo shared_talents
cd "%~dp0\3. General Data Files\shared_talents"
call update.bat 
cd ..\..
echo zoneinfo
cd "%~dp0\3. General Data Files\zoneinfo"
call update.bat 
cd ..\..

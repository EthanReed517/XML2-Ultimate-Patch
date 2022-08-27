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
echo Beast
cd "%~dp0\1. Playable Characters\Beast"
call update.bat 
cd ..\..
echo Bishop
cd "%~dp0\1. Playable Characters\Bishop"
call update.bat 
cd ..\..
echo Colossus
cd "%~dp0\1. Playable Characters\Colossus"
call update.bat 
cd ..\..
echo Cyclops
cd "%~dp0\1. Playable Characters\Cyclops"
call update.bat 
cd ..\..
echo Deadpool
cd "%~dp0\1. Playable Characters\Deadpool"
call update.bat 
cd ..\..
echo Gambit
cd "%~dp0\1. Playable Characters\Gambit"
call update.bat 
cd ..\..
echo Iceman
cd "%~dp0\1. Playable Characters\Iceman"
call update.bat 
cd ..\..
echo Iron Man
cd "%~dp0\1. Playable Characters\Iron Man"
call update.bat 
cd ..\..
echo Jean Grey
cd "%~dp0\1. Playable Characters\Jean Grey"
call update.bat 
cd ..\..
echo Juggernaut
cd "%~dp0\1. Playable Characters\Juggernaut"
call update.bat 
cd ..\..
echo Magneto
cd "%~dp0\1. Playable Characters\Magneto"
call update.bat 
cd ..\..
echo Nightcrawler
cd "%~dp0\1. Playable Characters\Nightcrawler"
call update.bat 
cd ..\..
echo Professor X
cd "%~dp0\1. Playable Characters\Professor X"
call update.bat 
cd ..\..
echo Pyro
cd "%~dp0\1. Playable Characters\Pyro"
call update.bat 
cd ..\..
echo Rogue
cd "%~dp0\1. Playable Characters\Rogue"
call update.bat 
cd ..\..
echo Sabretooth
cd "%~dp0\1. Playable Characters\Sabretooth"
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

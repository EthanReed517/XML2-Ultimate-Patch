@echo off

REM -----------------------------------------------------------------------------

REM Settings:

REM What operation should be made? (=decompile; =compile; =edit; =convert; =ask; =detect)
set operation=compile
REM Set the decompile/convert format: (JSON =json; true XML =xml; NBA2kStuff's XML =lxml)
set decformat=json
REM Rename the decompiled extension to below? (enter the extension, eg.: =txt; don't rename: customext=)
set customext=
REM Delete decompiled files? (yes =true; no =false)
set deletedec=false
REM Allow all file formats, when dragging&dropping files? (yes =true; no =false)
set allowfext=true
REM Always compile to this format if the format couldn't be detected (eg. =xmlb)
set extALL=

REM -----------------------------------------------------------------------------

REM these are automatic settings, don't edit them:
set x=0
set inext=.txt, .xml, .json
set "erl=%~dp0error.log"
set "rfo=%~dp0RFoutput.log"
set "xco=%~dp0XCoutput.log"
del "%erl%"
del "%rfo%"
del "%xco%"
if not defined customext set customext=%decformat:lxml=xml%
if "%operation%" == "ask" call :askop
call :start%operation%
REM Zsnd variables
set hs="hash":
set si="sample_index":
set sa=    "samples": [
set fs="file":
set sr="sample_rate":
CLS


if "%remHead%" == "true" (
 echo.
 choice /m "Do you want to change/remove the header of all input WAVs"
 if ERRORLEVEL 2 set remHead=false
)

for %%p in (%*) do goto isnotbatch

:isbatch
set "f=%~dp0"
set "fullpath=%f:~0,-1%"
call :isfolder
GOTO End

:isnotbatch
if not defined inall call :convCCL
for %%p in (%inall%) do (
 set fullpath=%%~p
 2>nul pushd "%%~p" && call :isfolder || call :isfiles
)
GOTO End

:isfolder
for %%e in (%inext%) do for /f "delims=" %%i in ('dir /b /s "%fullpath%\*%%e" 2^>nul') do if not "%%~fi" == "%~dp0temp.igb" (
 set "fullpath=%%~fi"
 call :filesetup
 call :%operation%
)
EXIT /b

:isfiles
call :filesetup
if "%allowfext%" == "true" ( call :%operation%
) else for %%e in (%inext%) do if /i "%xtnsonly%" == "%%e" call :%operation%
EXIT /b

:convCCL
set "i=%cmdcmdline:"=""%"
set "i=%i:*"" =%"
set "i=%i:~0,-2%"
set "i=%i:^=^^%"
set "i=%i:&=^&%"
set "i=%i: =^ ^ %"
set i=%i:""="%
set "i=%i:"=""Q%"
set "i=%i:  ="S"S%"
set "i=%i:^ ^ = %"
set "i=%i:""="%"
set "i=%i:"Q=%"
set inall="%i:"S"S=" "%"
EXIT /b


:filesetup
for %%i in ("%fullpath%") do (
 set pathonly=%%~dpi
 set pathname=%%~dpni
 set nameonly=%%~ni
 set namextns=%%~nxi
 set xtnsonly=%%~xi
)
EXIT /b
:RFext
set inext=.xmlb, .engb, .freb, .gerb, .itab, .polb, .rusb, .spab, .pkgb, .boyb, .chrb, .navb
EXIT /b


:askop
CHOICE /C DECV /M "[D]ecompile, [e]dit, [c]ompile, or con[v]ert all files"
IF ERRORLEVEL 4 SET "operation=convert" & EXIT /b
IF ERRORLEVEL 3 SET "operation=compile" & EXIT /b
IF ERRORLEVEL 2 SET "operation=edit" & EXIT /b
IF ERRORLEVEL 1 SET "operation=decompile" & EXIT /b
EXIT /b

:startextract
set inext=.zss, .zsm
goto czs
:startaddFileAtIndex
set oldjson=f
:startaddWAV
REM PSP, PS2 =vag; Xbox =XBADPCM; Xbox 360 =XMA; PC WAV; Wii & Gamecube =dsp
set inext=.wav, .xma, .xbadpcm, .vag, .dsp
del "%~dp0zsnd.tmp" 2>nul
:startconvertW
set "cnv=%~dp0toconvert"
set "cvd=%~dp0converted"
if not defined inext set inext=.wav
set sf=%sfreq%
if not defined sf call :askfreqrate
goto czs
:startcombine
set inext=.json
:czs
call :checkTools zsnd || call :checkPython
if "%forcezsnd%" == "true" set "outfile=%outfile:true=false%" & set Zsnd=py "%zsndp%\zsnd.py"
call set "outfile=%%%outfile:false=%~dp0%%"
set "outfile=%outfile:true=%"
EXIT /b
:starteditJSON
set inext=.json
EXIT /b
:startedit
:startdecompile
call :RFext
goto xml
:startdetect
set inext=*.*
set allowfext=true
:startcompile
:xml
set xm=xmlb&if "%decformat%" == "lxml" set xm=xmlb-compile
call :checkTools %xm% && EXIT /b
echo %xm% not found. Check the Readme.
goto Errors

:detect
for %%e in (.txt, .xml, .json) do if /i "%xtnsonly%" == "%%e" goto compile
call :RFext
for %%e in (%inext%) do if /i "%xtnsonly%" == "%%e" goto decompile
for %%e in (.wav) do if /i "%xtnsonly%" == "%%e" goto addWAV
for %%e in (.zss, .zsm) do if /i "%xtnsonly%" == "%%e" goto extract
for %%e in (.json) do if /i "%xtnsonly%" == "%%e" goto combine
EXIT /b

:convert
call :checkVersion
if not defined XC goto convertRF
if "%decformat%" == "lxml" set XC=& EXIT /b
call :checkExist json || EXIT /b 1
if not defined conv call :checkConv
%conv% "%fullpath%" 2>"%rfo%"
for /f %%e in ("%rfo%") do if %%~ze GTR 0 call :writerror RF & EXIT /b 1
if "%deletedec%" == "true" del "%fullpath%"
set "fullpath=%pathname%.json"
:convertRF
if "%operation%" == "compile" EXIT /b 0
call :filesetup
if ".%decformat%" == "%xtnsonly%" EXIT /b 0
if "%deletedec%" == "true" set XC=d
set decformat=json& call :xml & set decformat=%decformat%
call :RUNxmlb .temp "" "" %xtnsonly% && if defined XC del "%fullpath%"
call :xml
set "numBKP=%pathname%.%dex%" & call :numberedBKP
call :RUNxmlb .%dex% .temp -d
del "%fullpath%.temp"
set "fullpath=%pathname%.%dex%"
EXIT /b 0
:checkVersion
set XC=
set /p version=<"%fullpath%"
set "version=%version%"
if "%version:~0,1%" == "<" ( call :fixExt xml
) else if "%version:~0,1%" == "{" ( call :fixExt json
) else set XC=convert
EXIT /b 0
:fixExt
if /i "%xtnsonly%" == ".%1" EXIT /b
call :checkExist %1 || EXIT /b
move /y "%fullpath%" "%pathname%.%1" >nul
set "fullpath=%pathname%.%1"
EXIT /b

:compile
call :convert || EXIT /b
call :setup
call :RUNxmlb .%extension% && if "%deletedec%" == "true" del "%fullpath%"
if defined XC del "%fullpath%" & set XC=
EXIT /b 0

:decompile
call :RUNxmlb .%dex% "" -d %xtnsonly%
move /y "%fullpath%.%dex%" "%fullpath%.%customext%" >nul
EXIT /b

:edit
call :decompile
notepad "%fullpath%.%customext%"
move /y "%fullpath%.%customext%" "%fullpath%.%dex%" >nul
call :RUNxmlb %xtnsonly% .%dex% && if "%deletedec%" == "true" for %%e in ("%dex%" "bak") do del "%fullpath%.%%e"
EXIT /b 0

:setup
for %%e in ("xmlb" "engb" "freb" "gerb" "itab" "polb" "rusb" "spab" "pkgb" "boyb" "chrb" "navb") do if /i ".%%~e" == "%nameonly:~-5%" set "extension=%%~e" & set "pathname=%pathname:~0,-5%" & EXIT /b
if defined extALL set "extension=%extALL%" & EXIT /b
call :Formats
if %x% GTR 1 (
 choice /m "Do you want to compile all remaining input files to %extension%"
 if not ERRORLEVEL 2 set extALL=%extension%
)
EXIT /b
:Formats
CLS
ECHO 1. xmlb (default without display text)
ECHO 2. engb (default with English display text)
ECHO 3. pkgb (for files in packages folder only)
ECHO 4. boyb (for map buoys in maps folder only)
ECHO 5. chrb (for map character lists in maps folder only)
ECHO 6. navb (for map navigation files in maps folder only)
ECHO 7. Other Languages
ECHO.
CHOICE /C 1234567 /M "Press the number for the format which you want to compile '%nameonly%' into:"
IF ERRORLEVEL 7 goto Languages
IF ERRORLEVEL 6 SET "extension=navb" & EXIT /b
IF ERRORLEVEL 5 SET "extension=chrb" & EXIT /b
IF ERRORLEVEL 4 SET "extension=boyb" & EXIT /b
IF ERRORLEVEL 3 SET "extension=pkgb" & EXIT /b
IF ERRORLEVEL 2 SET "extension=engb" & EXIT /b
IF ERRORLEVEL 1 SET "extension=xmlb" & EXIT /b
EXIT /b
:Languages
CLS
ECHO 1. freb (for all files with French display text)
ECHO 2. gerb (for all files with German display text)
ECHO 3. itab (for all files with Italian display text)
ECHO 4. polb (for all files with Polish display text)
ECHO 5. rusb (for all files with Russian display text)
ECHO 6. spab (for all files with Spanish display text)
ECHO 7. engb (default with English display text)
ECHO.
CHOICE /C 1234567 /M "Press the number for the format which you want to compile '%nameonly%' into:"
IF ERRORLEVEL 7 SET "extension=engb" & EXIT /b
IF ERRORLEVEL 6 SET "extension=spab" & EXIT /b
IF ERRORLEVEL 5 SET "extension=rusb" & EXIT /b
IF ERRORLEVEL 4 SET "extension=polb" & EXIT /b
IF ERRORLEVEL 3 SET "extension=itab" & EXIT /b
IF ERRORLEVEL 2 SET "extension=gerb" & EXIT /b
IF ERRORLEVEL 1 SET "extension=freb" & EXIT /b
EXIT /b

:RUNxmlb
%xmlb% %~3 "%fullpath%%~2" "%pathname%%~4%~1" 2>"%rfo%" 1>"%xco%"
if %errorlevel% GTR 0 call :writerror & EXIT /b 1
if "%decformat%%~3" == "lxml-d" move /y "%xco%" "%pathname%%~4%~1"
EXIT /b 0

:writerror
set errfile=
for /f "skip=2 delims=" %%e in ('find /i "error" "%rfo%" 2^>nul') do set "msg=%%e" & call :writeMsg>>"%erl%"
if "%1" == "RF" EXIT /b
for /f "delims=" %%e in ('type "%xco%"') do set "msg=%%e" & call :writeMsg>>"%erl%"
EXIT /b
:writeMsg
if not defined errfile echo "%fullpath%"
set "errfile=%nameonly%"
echo  %msg:&=^&%
EXIT /b

:checkTools program
if exist "%~dp0%1.exe" set %1="%~dp0%1.exe"
if not defined %1 for /f "delims=" %%a in ('where %1 2^>nul') do set %1=%1
echo %1 | find /i "XMLB" >nul && goto check%decformat%
if defined %1 EXIT /b 0
EXIT /b 1
:checklxml
if not defined %1 EXIT /b 1
call set "xmlb=%%%1%% -s"
set dex=%customext%
EXIT /b 0
:checkxml
:checkjson
set dex=%decformat%
if defined %1 EXIT /b 0
if exist "%~dp0json2xmlb.exe" set %1="%~dp0json2xmlb.exe" & EXIT /b 0
:checkPython
for /f "delims=" %%a in ('where py 2^>nul') do (
 for /f "delims=" %%b in ('where zsnd 2^>nul') do goto setRF
 PATH | find "Programs\Python\Python" >nul && goto instRF
)
echo Python is not correctly installed. Check the Readme.
goto Errors
:instRF
pip install --ignore-installed raven-formats
:setRF
set xmlb=xmlb
set Zsnd=Zsnd
EXIT /b 0
:checkConv
call :checkTools py
if exist "%~dp0xml2json.exe" set conv="%~dp0xml2json.exe"
if defined py if exist "%~dp0converter.py" set conv=py "%~dp0converter.py"
if not defined conv echo Converter not found. Check the Readme.>>"%erl%"
EXIT /b

:checkExist extension
set "numBKP=%pathname%.%1" 
rem if exist "%numBKP%" echo "%fullpath%": Error. "%nameonly%.%1" exists. Please use that file.>>"%erl%" & EXIT /b 1
:numberedBKP filename as var numBKP
if not exist "%numBKP%" EXIT /b 0
set /a n+=1
if exist "%numBKP%.%n%.bak" goto numberedBKP
for %%b in ("%numBKP%") do ren "%%~fb" "%%~nb.%n%.bak"
set n=0
EXIT /b 0


:End
call :%operation%Post
CLS
if not exist "%erl%" goto cleanup
:Errors
echo.
echo There was an error in the process. Check the error description.
if exist "%erl%" (
 echo.
 type "%erl%"
)
pause
:cleanup
if exist "%rfo%" del "%rfo%"
if exist "%xco%" del "%xco%"
EXIT

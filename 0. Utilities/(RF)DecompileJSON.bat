@echo off

REM -----------------------------------------------------------------------------

REM Settings:

REM What operation should be made? (=decompile; =compile; =edit; =convert; =ask; =detect)
set operation=decompile
REM Set the decompile format: (JSON =json; true XML =xml; NBA2kStuff's XML =lxml)
set decformat=json
REM Set the decompiled extension to TXT, while still using the above format? (=true; =false)
set txtextnsn=false
REM Delete decompiled files? (=true; =false)
set deletedec=false
REM Allow all file formats, when dragging&dropping files? (=true; =false)
set allowfext=true
REM Always compile to this format if the format couldn't be detected (eg. =xmlb)
set extALL=

REM -----------------------------------------------------------------------------

REM these are automatic settings, don't edit them:
set x=0
set inext=.txt, .xml, .json
if exist "%~dp0error.log" del "%~dp0error.log"
if exist "%~dp0RFoutput.log" del "%~dp0RFoutput.log"
if exist "%~dp0XCoutput.log" del "%~dp0XCoutput.log"
if "%operation%" == "ask" call :askop
for %%x in (xmlb-compile, xmlb, py) do call :checkTools %%x
if "%operation%" == "convert" ( call :checkConv
) else if "%decformat%" == "lxml" ( call :checkXC
) else call :checkRF
if "%operation%" == "decompile" ( call :RFext
) else if "%operation%" == "edit" call :RFext

:start
%dragndrop%
for %%p in (%*) do goto isnotbatch


:isbatch
set dragndrop=goto isbatch
for %%e in (%inext%) do call :setupextBa %%e
call :procfolder
GOTO End
:setupextBa
set inextA=%inextA%*%1, 
EXIT /b

:isnotbatch
set dragndrop=goto isnotbatch
set "inall=%cmdcmdline%"
set "inall=%inall:"=""%"
set "inall=%inall:*"" =%"
set "inall=%inall:~0,-2%"
set "inall=%inall:^=^^%"
set "inall=%inall:&=^&%"
set "inall=%inall: =^ ^ %"
set inall=%inall:""="%
set "inall=%inall:"=""Q%"
set "inall=%inall:  ="S"S%"
set "inall=%inall:^ ^ = %"
set "inall=%inall:""="%"
setlocal enableDelayedExpansion
set "inall=!inall:"Q=!"
for %%p in ("!inall:"S"S=" "!") do set /a x+=1
for %%p in ("!inall:"S"S=" "!") do (
 if "!!"=="" endlocal & set x=%x%
 set infiles=%%p
 2>nul pushd "%%~p" && call :isfolder || call :isfiles
)
GOTO End

:isfolder
set /a x-=1
for %%e in (%inext%) do call :setupextFo %%e
:procfolder
for %%i in (%inextA:~0,-2%) do set /a x+=1
for %%i in (%inextA:~0,-2%) do (
 set fullpath=%%~fi
 call :filesetup
 call :%operation%
)
EXIT /b
:setupextFo
set inextA=%inextA%"%infiles:~1,-1%\*%1", 
EXIT /b

:isfiles
set "fullpath=%infiles:~1,-1%"
call :filesetup
if "%allowfext%" == "true" ( call :%operation%
) else for %%e in (%inext%) do if /i "%xtnsonly%" == "%%e" call :%operation%
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

:detect
for %%e in (%inext%) do if /i "%xtnsonly%" == "%%e" goto compile
call :RFext
for %%e in (%inext%) do if /i "%xtnsonly%" == "%%e" goto decompile
set inext=.txt, .xml, .json
EXIT /b

:convert
call :checkVersion
if not defined XC EXIT /b
if exist "%pathname%.json" echo "%fullpath%": Error. "%nameonly%.json" exists. Please use that file. >>"%~dp0error.log" & EXIT /b
if not defined conv call :checkConv
%conv% "%fullpath%" 2>"%~dp0RFoutput.log"
for /f %%e in ("%~dp0RFoutput.log") do if %%~ze GTR 0 ( call :writerror RF
) else set "xtnsonly=.json" & if "%deletedec%" == "true" del "%fullpath%"
set "fullpath=%pathname%%xtnsonly%"
EXIT /b
:checkVersion
set /p version=<"%fullpath%"
set "version=%version%"
if "%version:~0,1%" == "<" (
 if /i not "%xtnsonly%" == ".xml" if exist "%pathname%.xml" ( echo "%fullpath%": Error. "%nameonly%.xml" exists. Please use that file. >>"%~dp0error.log"
 ) else ren "%fullpath%" "%nameonly%.xml" & set "fullpath=%pathname%.xml"
) else if "%version%" == "{" (
 if /i not "%xtnsonly%" == ".json" if exist "%pathname%.json" ( echo "%fullpath%": Error. "%nameonly%.json" exists. Please use that file. >>"%~dp0error.log"
 ) else ren "%fullpath%" "%nameonly%.json" & set "fullpath=%pathname%.json"
) else set XC=convert
EXIT /b

:compile
if defined XC (set XC=compile) else call :convert
call :setup
call :RUNxmlb .%extension% && if "%deletedec%" == "true" del "%fullpath%"
if "%XC%" == "convert" del "%fullpath%" & set XC=
pause
EXIT /b 0

:decompile
if defined XC set XC=decompile
call :RUNxmlb .%decformat% "" -d %xtnsonly%
if defined rentxt move /y "%fullpath%.%decformat%" "%fullpath%.txt"
EXIT /b

:edit
call :decompile
if defined rentxt (set ext=txt) else set ext=%decformat%
notepad "%fullpath%.%ext%"
if defined rentxt copy /y "%fullpath%.txt" "%fullpath%.%decformat%"
if defined XC set XC=compile
call :RUNxmlb %xtnsonly% .%decformat% && if "%deletedec%" == "true" for %%e in ("%decformat%" "txt" "bak") do del "%fullpath%.%%e"
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
%xmlb% %3 "%fullpath%%~2" "%pathname%%~4%~1" 2>"%~dp0RFoutput.log" 1>"%~dp0XCoutput.log"
if %errorlevel% GTR 0 call :writerror & EXIT /b 1
REM echo "%fullpath%" >>"%~dp0error.log"   :: The Error may not appear with writerror. This problem is unlikely, however. For now, this is not included.
if "%XC%" == "decompile" move /y "%~dp0XCoutput.log" "%pathname%%~4%~1"
EXIT /b 0

:writerror
set errfile=
for /f "skip=2 delims=" %%e in ('find /i "error" "%~dp0RFoutput.log" 2^>nul') do set "msg=%%e" & call :writeMsg
if "%1" == "RF" EXIT /b
for /f "delims=" %%e in ('type "%~dp0XCoutput.log"') do set "msg=%%e" & call :writeMsg
EXIT /b
:writeMsg
if not defined errfile echo "%fullpath%" >>"%~dp0error.log"
set "errfile=%nameonly%"
echo  %msg:&=^&% >>"%~dp0error.log"
EXIT /b

:checkTools program extension
if "%~2" == "" (set exe=exe) else set exe=%2
for /f "delims=" %%a in ('where %1 2^>nul') do set %1=%1
if not defined %1 if exist "%~dp0%1.%exe%" set %1="%~dp0%1.%exe%"
EXIT /b
:checkConv
if defined py ( if exist "%~dp0converter.py" set conv=py "%~dp0converter.py"
) else if exist "%~dp0xml2json.exe" set conv="%~dp0xml2json.exe"
if not defined conv echo Converter not found. Check the Readme. & goto Errors
EXIT /b
:checkXC
if not defined xmlb-compile echo xmlb-compile not found. Check the Readme. & goto Errors
set xmlb=%xmlb-compile% -s
set XC=decompile
if "%txtextnsn%" == "true" (set decformat=txt) else set decformat=xml
EXIT /b
:checkRF
if not defined xmlb if exist "%~dp0json2xmlb.exe" ( set xmlb="%~dp0json2xmlb.exe"
) else echo Raven Formats not found. Check the Readme. & goto Errors
if "%txtextnsn%" == "true" set rentxt=true
EXIT /b


:End
call :%operation%Post
if not exist "%~dp0error.log" goto cleanup
:Errors
echo.
echo There was an error in the process. Check the error description.
if exist "%~dp0error.log" (
 echo.
 type "%~dp0error.log"
)
pause
:cleanup
if exist "%~dp0RFoutput.log" del "%~dp0RFoutput.log"
if exist "%~dp0XCoutput.log" del "%~dp0XCoutput.log"
EXIT

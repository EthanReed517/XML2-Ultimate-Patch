@ECHO OFF
setlocal enableDelayedExpansion
CHOICE /M "Do you want to create PKG files"
IF ERRORLEVEL 1 SET "delpkg=REM"
IF ERRORLEVEL 2 SET "delpkg=del "%%~fv.pkg" /f /q"
set "cmd=!cmdcmdline!"
set "cmd2=!cmd:*%~f0=!"
if "!cmd2!" == "!cmd!" goto isbatch
for %%p in (%*) do 2>nul pushd "%~1" && goto isfolder || goto isfiles

:isbatch
for %%v in (*.fb) do (
 fbextractor.exe "%%~nxv"
 %delpkg%
)
goto End

:isfolder
for %%p in (%*) do (
 for %%v in ("%%~p\*.fb") do (
  fbextractor.exe "%%~fv"
  %delpkg%
 )
)
goto End

:isfiles
for %%v in (%*) do (
 fbextractor.exe "%%~fv"
 %delpkg%
)

:End
endlocal
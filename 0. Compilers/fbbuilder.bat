@ECHO OFF
setlocal enableDelayedExpansion
set "cmd=!cmdcmdline!"
set "cmd2=!cmd:*%~f0=!"
if "!cmd2!" == "!cmd!" goto isbatch
for %%p in (%*) do 2>nul pushd "%~1" && goto isfolder || goto isfiles

:isbatch
for %%v in (*.cfg) do (
 wscript enter.vbs
 echo %%~nxv | fbbuilder.exe
 move /y "%%~nxv.fb" "%%~nv"
)
goto End

:isfolder
for %%p in (%*) do (
 dir %%p
 for %%v in ("%%~p\*.cfg") do (
  wscript enter.vbs
  echo %%~nxv | fbbuilder.exe
  move /y "%%~nxv.fb" "%%~nv"
 )
)
goto End

:isfiles
for %%v in (%*) do (
 wscript enter.vbs
 echo %%~nxv | fbbuilder.exe
 move /y "%%~nxv.fb" "%%~nv"
)

:End
endlocal
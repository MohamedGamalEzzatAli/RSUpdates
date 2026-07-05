@echo off
rem push_patch.bat "commit message"  -- publish the current override_ar + exe to the patch repo
cd /d "%~dp0"
if "%~1"=="" (
  set "MSG=patch update"
) else (
  set "MSG=%~1"
)
rem bump the version counter
set /p V=<patch_version.txt
set /a V=%V%+1
echo %V%> patch_version.txt

git add -A
git commit -m "%MSG% (v%V%)"
git push origin main
echo.
echo Published patch v%V%. Testers will get it on next launch.
pause

@echo off
rem === self-elevate to Administrator ===
net session >nul 2>&1
if %errorlevel% neq 0 (
  powershell -NoProfile -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
  exit /b
)
cd /d "%~dp0"
set "REPO=https://github.com/MohamedGamalEzzatAli/RSUpdates.git"

rem --- force-update the patch from the server (overrides any local changes) ---
where git >nul 2>&1
if %errorlevel%==0 (
  echo Updating to the latest version...
  git remote set-url origin "%REPO%" 2>nul
  git fetch --depth 1 origin main
  git checkout -f -B main FETCH_HEAD
) else (
  echo [!] Git not found - skipping update. Use PLAY_ARABIC.bat for automatic setup.
)

rem RECOVERY 2026-07-05: data.001.ar is corrupt; using pristine data.001 + /secondres override. Re-enable copy after final repack.
rem copy /Y "data.001.ar" "data.001" >nul
set "__COMPAT_LAYER=RunAsInvoker"
RappelzCmdLauncher.exe SFrame_ME.exe /auth_ip:127.0.0.1 /auth_port:4500 /use_nprotect:0 /country:ME /locale:windows-1256 /notenc /secondres:override_ar

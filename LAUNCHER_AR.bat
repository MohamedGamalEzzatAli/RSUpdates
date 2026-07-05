@echo off
cd /d "%~dp0"
rem --- auto-update the patch (override_ar + exe) from the GitHub patch repo ---
where git >nul 2>&1
if %errorlevel%==0 (
  echo Checking for updates...
  git pull --ff-only
) else (
  echo [!] Git not found - skipping update. Install Git to receive updates automatically.
)
rem RECOVERY 2026-07-05: data.001.ar is corrupt; using pristine data.001 + /secondres override. Re-enable after final repack.
rem copy /Y "data.001.ar" "data.001" >nul
set "__COMPAT_LAYER=RunAsInvoker"
RappelzCmdLauncher.exe SFrame_ME.exe /auth_ip:127.0.0.1 /auth_port:4500 /use_nprotect:0 /country:ME /locale:windows-1256 /notenc /secondres:override_ar

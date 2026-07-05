@echo off
rem Actual game launch (TRACKED in the patch repo, so server IP/port updates reach testers).
cd /d "%~dp0"
set "__COMPAT_LAYER=RunAsInvoker"
RappelzCmdLauncher.exe SFrame_ME.exe /auth_ip:173.249.37.7 /auth_port:4615 /use_nprotect:0 /country:ME /locale:windows-1256 /notenc /secondres:override_ar

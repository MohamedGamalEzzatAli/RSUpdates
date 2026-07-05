# Dejavu91 — Arabic Client Patch (auto-update)

This folder is a **git patch repo**: it tracks ONLY the small client changes
(`override_ar/`, `SFrame_ME.exe`, `LAUNCHER_AR.bat`) — NOT the multi-GB base client
(`data.00*` are git-ignored). Testers run the launcher; it `git pull`s the latest
patch before starting the game.

## How it works
- All our changes live as **loose files** in `override_ar/` (item/string/motion DB,
  icon sheets, 742 item icons). The client loads them via `/secondres:override_ar`,
  overriding the base packs — no repacking, no corruption risk.
- `LAUNCHER_AR.bat` runs `git pull --ff-only` first, so testers always get the newest patch.

## Tester setup (one time)
1. Get the **base client** once (the full `RappelzClient` with `data.00*`, `RappelzCmdLauncher.exe`, etc.) — shared separately (too big for git).
2. Install **Git for Windows** (https://git-scm.com/download/win).
3. Open a terminal in the client folder and link it to the patch repo:
   ```
   cd <path>\RappelzClient
   git init
   git remote add origin <PATCH_REPO_URL>
   git fetch origin
   git checkout -f main
   ```
   (This pulls in `override_ar/`, `SFrame_ME.exe`, `LAUNCHER_AR.bat` without touching the ignored base files.)
4. Run **`LAUNCHER_AR.bat`** — it auto-updates and launches.

## Every launch after that
Just run `LAUNCHER_AR.bat`. It pulls the latest patch and starts the game.

## Developer (you) — publish an update
After changing anything in `override_ar/` (or rebuilding `SFrame_ME.exe`):
```
cd <path>\RappelzClient
push_patch.bat "what changed"
```
Testers get it on their next launch.

## Notes
- Base-client files (`data.00*`, other exes) are git-ignored — never committed.
- `patch_version.txt` is a human-readable build counter (optional).
- Final release: fold `override_ar/` into `data.00*` (one clean repack), re-enable the
  `copy data.001.ar` line in the launcher, drop `/secondres` and the git-pull.

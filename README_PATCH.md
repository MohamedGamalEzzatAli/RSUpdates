# Dejavu91 — Arabic Client Patch (zero-setup auto-update)

This is a **git patch repo** tracking only the small Arabic client changes
(`override_ar/`, `SFrame_ME.exe`, `LAUNCHER_AR.bat`) — NOT the multi-GB base client
(`data.00*` are git-ignored). Testers run **`PLAY_ARABIC.bat`** and everything is automatic.

## How it works
- Changes live as loose files in `override_ar/` (item/string/motion DB, icon sheets, 742 item icons).
  The client loads them via `/secondres:override_ar`, overriding the base packs — no repacking.
- **`PLAY_ARABIC.bat`** (ships with the base client) auto-installs a portable Git, links to this
  repo, pulls the latest patch, and launches — no manual steps.

## Tester setup — ZERO setup
1. Get the **base client** once (the full `RappelzClient` folder — shared separately, too big for git).
   It already contains `PLAY_ARABIC.bat`.
2. Double-click **`PLAY_ARABIC.bat`**. On first run it:
   - downloads a portable Git (~40 MB, no admin, no install wizard) into `_git\`,
   - downloads the latest Arabic patch from GitHub,
   - launches the game.
3. Every later run: it just pulls the newest patch and launches.

That's it — no Git install, no commands, no accounts.

## Developer (you) — publish an update
After changing anything in `override_ar/` (or rebuilding `SFrame_ME.exe`):
```
push_patch.bat "what changed"
```
Testers get it automatically on their next `PLAY_ARABIC.bat` run.

## Notes
- `PLAY_ARABIC.bat` and `_git\` are git-ignored (bootstrap + portable Git stay local; ship
  `PLAY_ARABIC.bat` inside the base-client folder you distribute).
- `LAUNCHER_AR.bat` is the plain launcher (no bootstrap) for machines that already have Git.
- Final release: fold `override_ar/` into `data.00*` (one clean repack), re-enable the
  `copy data.001.ar` line, drop `/secondres` and the auto-update.

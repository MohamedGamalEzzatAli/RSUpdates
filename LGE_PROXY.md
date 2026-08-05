# Legacy Graphics Engine Proxy — Patch v143

This patch repository entry records the exact Legacy Graphics Engine (LGE)
source and verification provenance for `d3d9.dll`.

## Source

- Repository: https://github.com/AhmedEzzat211/legacy-graphics-engine
- Draft source pull request: https://github.com/AhmedEzzat211/legacy-graphics-engine/pull/2
- Branch: `phase-16-visual-enhancement`
- Commit: `286db023a67fd6d263163c25bfa710e4f0812686`
- Build target: `x86 Release`
- Build output: `build-x86/tools/proxy-dll-loader/Release/d3d9.dll`

## Binary identity

- File: `d3d9.dll`
- Byte length: `3,274,752`
- SHA-256: `99949A9AD767B95B7E1007EEF1CD93CA141C0EBD96CBC4687ED5054CE4C7E5E2`

The tracked DLL was compared directly with the final verified LGE build output;
both byte length and SHA-256 matched.

## Verification

The final committed-tree LGE verifier passed with zero failing suites:

- C++/CTest: `819/819`
- Render Inspector MCP: `passed` (the verifier emits no numeric count)
- Image diff: `13/13`
- Release input/module tests: `2/2`
- Release archive verification: `1/1`

The focused Render Inspector package gate separately passed `305/305` tests
across 32 files.

## Automatic-update boundary

Merging the v143 pull request in this patch repository makes this DLL available
to the automatic client update path. Until that merge occurs, this branch and
its draft pull request do not update testers or players.

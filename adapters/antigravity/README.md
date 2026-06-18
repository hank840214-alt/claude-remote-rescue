# Antigravity Adapter

Antigravity supports open-standard Agent Skills and workspace instructions. This repository includes:

- `skills/claude-remote-rescue/SKILL.md`
- root `AGENTS.md`
- `adapters/antigravity/AGENTS.md`

On macOS, `/Applications/Antigravity.app/Contents/MacOS/Antigravity` is the GUI app binary, not a CLI-compatible `antigravity --help` entrypoint. Do not use the app binary as an automated CLI adapter; it starts the app and local server.

Verify the local state:

```bash
adapters/antigravity/verify.zsh
```

When a real `antigravity` CLI is available in `PATH`, use the same `SKILL.md` folder and `AGENTS.md` instructions as the adapter payload.

The verifier reports:

- whether `antigravity` is in `PATH`
- whether the GUI app is installed
- the app bundle version and URL schemes when available

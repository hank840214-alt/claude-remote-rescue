# Agent Instructions

Use this repository as a macOS-first rescue toolkit for Claude remote-control sessions.

Core rules:

- Keep conversation titles separate from remote-control environment names.
- Never rename a Claude conversation while trying to send `/remote-control`.
- Use `bin/claude-rescue --status` before restarting anything.
- Use `bin/claude-rescue --print` for dry runs before changing live server state.
- Do not commit local Claude session URLs, tmux capture logs, app logs, tokens, keys, or screenshots.
- Run `scripts/scan-sensitive.zsh` before publishing changes.

Useful commands:

```bash
bin/claude-rescue --status
bin/claude-rescue . --title "Exact Claude session title" --print
scripts/verify-adapters.zsh
scripts/scan-sensitive.zsh
```

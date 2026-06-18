# Antigravity Agent Instructions

Use the open-standard skill at `skills/claude-remote-rescue/SKILL.md` for Claude remote-control rescue tasks.

Follow these rules:

- Check `bin/claude-rescue --status` before restarting remote-control.
- Use `bin/claude-rescue --print` for dry runs.
- Treat the requested Claude conversation title as data, not as a rename request.
- Do not use `/Applications/Antigravity.app/Contents/MacOS/Antigravity` as a CLI entrypoint; it launches the GUI app.
- Do not write local app logs, CSRF tokens, session URLs, screenshots, or tmux captures into the repository.

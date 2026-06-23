---
name: claude-remote-rescue
description: Rescue Claude Code Desktop and Claude remote-control sessions on macOS. Use when the user asks to unarchive an archived Claude session, remote-control any specific Claude conversation/session title, send `/remote-control`, recover from Claude remote-control being archived, avoid phone remote-desktop rescue, restart/check `claude remote-control`, or use the local `claude-remote` / `claude-rescue` wrappers from the correct repo or cwd.
---

# Claude Remote Rescue

Recover Claude remote-control in two layers: keep the local remote-control server alive from the right directory, then use Claude Desktop UI rescue only when an exact archived conversation must be reopened.

Distinguish these names before acting:

- **Claude conversation/session title**: the chat in Claude Desktop. Do not rename it unless the user explicitly asks.
- **Remote-control environment name**: the label passed to `claude remote-control --name`. Prefer a generic label unless the user explicitly asks for a custom one.

## Workflow

1. Parse the user's target.
   - If they gave one or more conversation titles, use each title exactly.
   - If they gave a repo/path, use it.
   - If they only said "Claude remote control archived", check server status first and ask for the exact conversation title only if UI rescue is required.

2. Check or restart the local server.
   - Run `claude-rescue --status`.
   - If no remote-control server is alive, start it from the correct directory with `claude-rescue <path>`.
   - Use `--restart` only when the existing tmux session is stale, wrong, or explicitly needs replacement.

3. Use Claude Desktop UI rescue when needed.
   - Bring Claude Desktop forward.
   - Search/open the exact conversation title requested for this rescue.
   - If the conversation is archived, use the available Archive/More menu to unarchive it.
   - Send `/remote-control` in that conversation.
   - Do not accept slash-command autocomplete for the wrong command. Prefer setting the focused text area value to exactly `/remote-control`, then click send.

4. Verify.
   - Check `claude-rescue --status`; tmux pane output is hidden by default to avoid leaking live remote-control URLs.
   - Capture a Claude Desktop screenshot after sending `/remote-control` or otherwise confirm the command is visible in the correct conversation.
   - If login, 2FA, CAPTCHA, password, or a security prompt appears, stop and ask the user to handle it.

## Rules

- Use a computer-control capability before directly controlling local Mac apps.
- Never rename a Claude conversation while trying to remote-control it.
- Treat unarchive as a cloud-state action: if the user asked to unarchive a named session, proceed; otherwise confirm before changing archive state.
- Keep phone remote-desktop as a fallback, not the primary rescue path.

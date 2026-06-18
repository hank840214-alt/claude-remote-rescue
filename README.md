# Claude Remote Rescue

Small macOS-first helpers for keeping Claude Code remote-control usable when a Claude conversation is archived, stale, or hard to recover from a phone.

The workflow has two parts:

- `claude-remote`: a stable wrapper around `claude remote-control` that chooses the right working directory, spawn mode, name, and strips inherited `ANTHROPIC_API_KEY`.
- `claude-rescue`: a tmux-backed rescue command that checks, starts, restarts, and documents the exact Claude Desktop conversation title that should be unarchived and sent `/remote-control`.

This does not bypass Claude login, 2FA, CAPTCHA, password prompts, or security confirmation screens.

## Install

```bash
./install.zsh
```

By default this installs:

- CLI commands to `$HOME/.local/bin`
- Codex skill to `${CODEX_HOME:-$HOME/.codex}/skills/claude-remote-rescue`

Override destinations:

```bash
CLAUDE_RESCUE_BIN_DIR=/usr/local/bin ./install.zsh
CLAUDE_RESCUE_SKILL_DIR=/path/to/skills ./install.zsh
```

## Usage

Check status:

```bash
claude-rescue --status
```

Start or reuse a remote-control server for a project:

```bash
claude-rescue ~/project --name "Codex remote" --same-dir
```

Target any Claude Desktop conversation title for UI rescue notes:

```bash
claude-rescue ~/project --title "Exact Claude session title" --name "Codex remote" --same-dir
```

Restart the tmux-backed server:

```bash
claude-rescue ~/project --restart --name "Codex remote"
```

Dry run without changing server state:

```bash
claude-rescue ~/project --title "Exact Claude session title" --print
```

## Agent Workflow

When using the bundled `claude-remote-rescue` skill, the agent should:

1. Check local server state with `claude-rescue --status`.
2. Start or restart remote-control from the correct repo/path when needed.
3. Only use Claude Desktop UI automation when the exact archived conversation must be reopened.
4. Send exactly `/remote-control` in the target conversation.
5. Never rename a Claude conversation while trying to remote-control it.

## Requirements

- macOS
- zsh
- tmux
- Claude CLI with `claude remote-control`
- Codex app/CLI only if installing and using the skill

## License

Choose a license before publishing. MIT is usually the simplest option for a small utility like this.

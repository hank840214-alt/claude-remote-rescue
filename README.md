# Claude Remote Rescue

Small macOS-first helpers and agent skills for keeping Claude Code remote-control usable when a Claude conversation is archived, stale, or hard to recover from a phone.

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
- Claude Code personal skill to `${CLAUDE_HOME:-$HOME/.claude}/skills/claude-remote-rescue`

Override destinations:

```bash
CLAUDE_RESCUE_BIN_DIR=/usr/local/bin ./install.zsh
CLAUDE_RESCUE_SKILL_DIR=/path/to/skills ./install.zsh
CLAUDE_RESCUE_INSTALL_CODEX_SKILL=0 ./install.zsh
CLAUDE_RESCUE_INSTALL_CLAUDE_SKILL=0 ./install.zsh
```

Platform-specific adapters are also available:

```bash
adapters/claude-code/install.zsh
adapters/hermes/install.zsh
adapters/antigravity/verify.zsh
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

Status output hides tmux pane contents by default so live remote-control URLs are not printed accidentally. For local debugging only, pass `--show-tmux-output`.

## Agent Workflow

When using the bundled `claude-remote-rescue` skill, the agent should:

1. Check local server state with `claude-rescue --status`.
2. Start or restart remote-control from the correct repo/path when needed.
3. Only use Claude Desktop UI automation when the exact archived conversation must be reopened.
4. Send exactly `/remote-control` in the target conversation.
5. Never rename a Claude conversation while trying to remote-control it.

## Adapters

- **Claude Code CLI**: use `adapters/claude-code/install.zsh` to install the skill to `~/.claude/skills`, or run Claude with `--plugin-dir adapters/claude-code/plugin`.
- **Hermes**: use `adapters/hermes/install.zsh` to copy the same skill into `~/.hermes/skills/autonomous-ai-agents/claude-remote-rescue`. Hermes can preload it with `--skills claude-remote-rescue`. UI rescue also needs `cua-driver` and macOS Accessibility/Screen Recording permissions.
- **Antigravity**: `AGENTS.md` and `adapters/antigravity/AGENTS.md` provide open-standard agent instructions. The macOS app binary is not treated as the CLI; `adapters/antigravity/verify.zsh` reports whether a real CLI entrypoint is available and, if not, only verifies adapter assets.

## Verification

Run all non-destructive checks:

```bash
scripts/verify-adapters.zsh
scripts/scan-sensitive.zsh
```

The sensitive-data scan blocks common token/key patterns, private keys, Claude remote-control environment URLs, and Antigravity CSRF token log fragments. It intentionally allows literal environment variable names such as `ANTHROPIC_API_KEY` when no value is present.

## Requirements

- macOS
- zsh
- tmux
- Claude CLI with `claude remote-control`
- Codex app/CLI only if installing and using the skill
- Hermes only if using the Hermes adapter
- Antigravity CLI only if using the Antigravity adapter

## License

Choose a license before publishing. MIT is usually the simplest option for a small utility like this.

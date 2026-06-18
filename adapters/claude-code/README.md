# Claude Code Adapter

Claude Code supports personal skills at `~/.claude/skills/<skill-name>/SKILL.md` and plugin skills loaded with `--plugin-dir`.

Install the CLI helpers and personal skill:

```bash
adapters/claude-code/install.zsh
```

Use the plugin without installing a personal skill:

```bash
claude --plugin-dir adapters/claude-code/plugin
```

Then invoke:

```text
/claude-remote-rescue rescue "Exact Claude session title"
```

The skill should check `claude-rescue --status`, use dry runs before restarts, and only automate Claude Desktop UI after the user identifies the exact conversation title.

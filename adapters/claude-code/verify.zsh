#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h:h}"
skill_name="claude-remote-rescue"
claude_skill="${CLAUDE_RESCUE_CLAUDE_SKILL_DIR:-${CLAUDE_HOME:-${HOME}/.claude}/skills}/$skill_name/SKILL.md"

command -v claude >/dev/null 2>&1 || {
  print -u2 -- "Claude Code CLI not found in PATH."
  exit 1
}

print -- "Claude Code: $(claude --version)"
claude --help | rg --fixed-strings -- '--remote-control' >/dev/null
claude --help | rg --fixed-strings -- '--plugin-dir' >/dev/null
test -f "$repo_dir/skills/$skill_name/SKILL.md"
test -f "$repo_dir/adapters/claude-code/plugin/.claude-plugin/plugin.json"
test -f "$repo_dir/adapters/claude-code/plugin/skills/$skill_name/SKILL.md"

if [[ -f "$claude_skill" ]]; then
  print -- "Claude personal skill installed: $claude_skill"
else
  print -- "Claude personal skill not installed yet: $claude_skill"
  print -- "Run: adapters/claude-code/install.zsh"
fi

print -- "Claude Code adapter verified."

#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h:h}"
bin_dir="${CLAUDE_RESCUE_BIN_DIR:-${HOME}/.local/bin}"
claude_skill_dir="${CLAUDE_RESCUE_CLAUDE_SKILL_DIR:-${CLAUDE_HOME:-${HOME}/.claude}/skills}"
skill_name="claude-remote-rescue"

mkdir -p "$bin_dir" "$claude_skill_dir/$skill_name"
install -m 0755 "$repo_dir/bin/claude-remote" "$bin_dir/claude-remote"
install -m 0755 "$repo_dir/bin/claude-rescue" "$bin_dir/claude-rescue"
ditto "$repo_dir/skills/$skill_name" "$claude_skill_dir/$skill_name"

print -- "Installed Claude Code adapter:"
print -- "  $bin_dir/claude-remote"
print -- "  $bin_dir/claude-rescue"
print -- "  $claude_skill_dir/$skill_name"
print -- ""
print -- "Plugin alternative:"
print -- "  claude --plugin-dir ${(q)repo_dir}/adapters/claude-code/plugin"

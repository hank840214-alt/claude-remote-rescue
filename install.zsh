#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h}"
bin_dir="${CLAUDE_RESCUE_BIN_DIR:-${HOME}/.local/bin}"
skill_dir="${CLAUDE_RESCUE_SKILL_DIR:-${CODEX_HOME:-${HOME}/.codex}/skills}"
skill_name="claude-remote-rescue"

mkdir -p "$bin_dir" "$skill_dir"

install -m 0755 "$repo_dir/bin/claude-remote" "$bin_dir/claude-remote"
install -m 0755 "$repo_dir/bin/claude-rescue" "$bin_dir/claude-rescue"

mkdir -p "$skill_dir/$skill_name"
ditto "$repo_dir/skills/$skill_name" "$skill_dir/$skill_name"

print -- "Installed:"
print -- "  $bin_dir/claude-remote"
print -- "  $bin_dir/claude-rescue"
print -- "  $skill_dir/$skill_name"

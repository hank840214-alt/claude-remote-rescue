#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h}"
bin_dir="${CLAUDE_RESCUE_BIN_DIR:-${HOME}/.local/bin}"
codex_skill_dir="${CLAUDE_RESCUE_CODEX_SKILL_DIR:-${CLAUDE_RESCUE_SKILL_DIR:-${CODEX_HOME:-${HOME}/.codex}/skills}}"
claude_skill_dir="${CLAUDE_RESCUE_CLAUDE_SKILL_DIR:-${CLAUDE_HOME:-${HOME}/.claude}/skills}"
skill_name="claude-remote-rescue"
install_codex_skill="${CLAUDE_RESCUE_INSTALL_CODEX_SKILL:-1}"
install_claude_skill="${CLAUDE_RESCUE_INSTALL_CLAUDE_SKILL:-1}"

mkdir -p "$bin_dir"

install -m 0755 "$repo_dir/bin/claude-remote" "$bin_dir/claude-remote"
install -m 0755 "$repo_dir/bin/claude-rescue" "$bin_dir/claude-rescue"

if [[ "$install_codex_skill" != "0" ]]; then
  mkdir -p "$codex_skill_dir/$skill_name"
  ditto "$repo_dir/skills/$skill_name" "$codex_skill_dir/$skill_name"
fi

if [[ "$install_claude_skill" != "0" ]]; then
  mkdir -p "$claude_skill_dir/$skill_name"
  ditto "$repo_dir/skills/$skill_name" "$claude_skill_dir/$skill_name"
fi

print -- "Installed:"
print -- "  $bin_dir/claude-remote"
print -- "  $bin_dir/claude-rescue"
if [[ "$install_codex_skill" != "0" ]]; then
  print -- "  $codex_skill_dir/$skill_name"
fi
if [[ "$install_claude_skill" != "0" ]]; then
  print -- "  $claude_skill_dir/$skill_name"
fi

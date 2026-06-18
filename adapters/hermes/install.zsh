#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h:h}"
bin_dir="${CLAUDE_RESCUE_BIN_DIR:-${HOME}/.local/bin}"
hermes_home="${HERMES_HOME:-${HOME}/.hermes}"
hermes_skill_dir="${CLAUDE_RESCUE_HERMES_SKILL_DIR:-${hermes_home}/skills/autonomous-ai-agents}"
skill_name="claude-remote-rescue"

mkdir -p "$bin_dir" "$hermes_skill_dir/$skill_name"
install -m 0755 "$repo_dir/bin/claude-remote" "$bin_dir/claude-remote"
install -m 0755 "$repo_dir/bin/claude-rescue" "$bin_dir/claude-rescue"
ditto "$repo_dir/skills/$skill_name" "$hermes_skill_dir/$skill_name"

print -- "Installed Hermes adapter:"
print -- "  $bin_dir/claude-remote"
print -- "  $bin_dir/claude-rescue"
print -- "  $hermes_skill_dir/$skill_name"
print -- ""
print -- "Try:"
print -- "  hermes --skills $skill_name -z \"Check Claude remote-control status and tell me the next rescue step.\""

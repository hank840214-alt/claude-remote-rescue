#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h:h}"

test -f "$repo_dir/skills/claude-remote-rescue/SKILL.md"
test -f "$repo_dir/AGENTS.md"
test -f "$repo_dir/adapters/antigravity/AGENTS.md"

if command -v antigravity >/dev/null 2>&1; then
  print -- "Antigravity CLI found: $(command -v antigravity)"
  antigravity --version || true
else
  print -- "Antigravity CLI not found in PATH."
fi

if [[ -x /Applications/Antigravity.app/Contents/MacOS/Antigravity ]]; then
  print -- "Antigravity GUI app found. This is not used as a CLI adapter."
else
  print -- "Antigravity GUI app not found at the standard macOS path."
fi

print -- "Antigravity adapter assets verified."

#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h:h}"
app_path="/Applications/Antigravity.app"

test -f "$repo_dir/skills/claude-remote-rescue/SKILL.md"
test -f "$repo_dir/AGENTS.md"
test -f "$repo_dir/adapters/antigravity/AGENTS.md"

if command -v antigravity >/dev/null 2>&1; then
  print -- "Antigravity CLI found: $(command -v antigravity)"
  antigravity --version || true
else
  print -- "Antigravity CLI not found in PATH."
fi

if [[ -x "$app_path/Contents/MacOS/Antigravity" ]]; then
  print -- "Antigravity GUI app found. This is not used as a CLI adapter."
  if command -v plutil >/dev/null 2>&1; then
    version="$(plutil -extract CFBundleShortVersionString raw "$app_path/Contents/Info.plist" 2>/dev/null || true)"
    identifier="$(plutil -extract CFBundleIdentifier raw "$app_path/Contents/Info.plist" 2>/dev/null || true)"
    [[ -n "$identifier" ]] && print -- "Bundle identifier: $identifier"
    [[ -n "$version" ]] && print -- "Bundle version: $version"
    if plutil -p "$app_path/Contents/Info.plist" | rg --fixed-strings '"antigravity"' >/dev/null; then
      print -- "URL scheme: antigravity"
    fi
  fi
else
  print -- "Antigravity GUI app not found at the standard macOS path."
fi

print -- "Antigravity adapter assets verified."

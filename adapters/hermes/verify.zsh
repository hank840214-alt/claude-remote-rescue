#!/usr/bin/env zsh
set -euo pipefail

skill_name="claude-remote-rescue"

command -v hermes >/dev/null 2>&1 || {
  print -u2 -- "Hermes CLI not found in PATH."
  exit 1
}

print -- "$(hermes --version)"
if hermes skills list | rg --fixed-strings "$skill_name" >/dev/null; then
  print -- "Hermes skill installed: $skill_name"
else
  print -- "Hermes skill not installed yet: $skill_name"
  print -- "Run: adapters/hermes/install.zsh"
fi

computer_use_status="$(hermes computer-use status 2>&1 || true)"
print -- "$computer_use_status"
if print -- "$computer_use_status" | rg --fixed-strings "not installed" >/dev/null; then
  print -- "Hermes computer-use backend is not installed; shell-level rescue still works."
elif print -- "$computer_use_status" | rg --fixed-strings "installed" >/dev/null; then
  print -- "Hermes computer-use backend is available."
  if command -v cua-driver >/dev/null 2>&1; then
    cua-driver --version
    cua-driver permissions status || true
    print -- "Hermes MCP config can be generated with:"
    print -- "  cua-driver mcp-config --client hermes"
  fi
else
  print -- "Hermes computer-use backend status is unclear; shell-level rescue still works."
fi

print -- "Hermes adapter verified."

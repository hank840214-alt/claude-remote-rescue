#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h}"
cd "$repo_dir"

run() {
  print -- ""
  print -- "==> $*"
  "$@"
}

run zsh -n bin/claude-remote
run zsh -n bin/claude-rescue
run zsh -n install.zsh
run zsh -n adapters/claude-code/install.zsh
run zsh -n adapters/claude-code/verify.zsh
run zsh -n adapters/hermes/install.zsh
run zsh -n adapters/hermes/verify.zsh
run zsh -n adapters/antigravity/verify.zsh
run zsh -n scripts/scan-sensitive.zsh

run bin/claude-remote "$repo_dir" --name "Codex remote" --same-dir --print
run bin/claude-rescue "$repo_dir" --title "Example Claude session" --name "Codex remote" --same-dir --print --tail-lines 2
run adapters/claude-code/verify.zsh
run adapters/hermes/verify.zsh
run adapters/antigravity/verify.zsh
run scripts/scan-sensitive.zsh

print -- ""
print -- "Adapter verification completed."

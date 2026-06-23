#!/usr/bin/env zsh
set -euo pipefail

repo_dir="${0:A:h:h}"
cd "$repo_dir"

exclude_args=(
  --glob '!.git/**'
  --glob '!*.DS_Store'
  --glob '!node_modules/**'
  --glob '!scripts/scan-sensitive.zsh'
)

checks=(
  'GitHub token::gh[pousr]_[A-Za-z0-9_]{20,}'
  'OpenAI token::sk-[A-Za-z0-9]{20,}'
  'Anthropic token::sk-ant-[A-Za-z0-9_-]{20,}'
  'AWS access key::AKIA[0-9A-Z]{16}'
  'Private key::-----BEGIN (RSA|DSA|EC|OPENSSH|PRIVATE) KEY-----'
  'Claude remote environment URL::https://claude\.ai/code\?environment=env_[A-Za-z0-9]+'
  'Antigravity CSRF token::csrf_token[ =:]+[0-9a-fA-F-]{20,}'
  'Assigned secret value::(?i)(api[_-]?key|access[_-]?token|auth[_-]?token|secret|password)[[:space:]]*[:=][[:space:]]*["'\'']?[A-Za-z0-9_./+=-]{16,}'
)

failed=0
for check in "${checks[@]}"; do
  label="${check%%::*}"
  pattern="${check#*::}"
  if rg -n --pcre2 "${exclude_args[@]}" -- "$pattern" . >/tmp/claude-remote-rescue-scan.txt; then
    print -u2 -- "Potential sensitive data found: $label"
    cat /tmp/claude-remote-rescue-scan.txt >&2
    failed=1
  fi
done

rm -f /tmp/claude-remote-rescue-scan.txt

if [[ "$failed" -ne 0 ]]; then
  print -u2 -- "Sensitive-data scan failed."
  exit 1
fi

print -- "Sensitive-data scan passed."

# Security

This project should not contain user credentials, provider tokens, local session URLs, tmux pane captures, screenshots, or application logs.

Before publishing changes, run:

```bash
scripts/scan-sensitive.zsh
```

The scanner blocks common API tokens, private keys, Claude remote-control environment URLs, and Antigravity CSRF token fragments. If it reports a real secret, rotate that secret before pushing.

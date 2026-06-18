# Hermes Adapter

Hermes supports skills and can preload them with `--skills`.

Install:

```bash
adapters/hermes/install.zsh
```

Verify:

```bash
adapters/hermes/verify.zsh
```

Use:

```bash
hermes --skills claude-remote-rescue -z "Check Claude remote-control status and tell me the next rescue step."
```

For UI-level rescue, Hermes also needs its macOS computer-use backend:

```bash
hermes computer-use status
hermes computer-use install
```

If the backend is not installed, Hermes can still use shell-level `claude-rescue` checks, dry runs, and restart guidance.

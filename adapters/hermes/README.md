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

After installing the backend, check macOS permissions:

```bash
cua-driver permissions status
```

If Accessibility or Screen Recording are unknown or missing, grant them using the driver's own flow:

```bash
cua-driver permissions grant
```

To expose CuaDriver as an MCP server in Hermes, generate the config:

```bash
cua-driver mcp-config --client hermes
```

Paste the printed `mcp_servers` block into `~/.hermes/config.yaml`, then reload MCP inside Hermes.

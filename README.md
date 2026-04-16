# gh-teamwork

A [`gh` CLI extension](https://cli.github.com/manual/gh_extension) that bootstraps the [Teamwork](https://github.com/JoshLuedeman/teamwork) AI development framework into any repository.

## Installation

```bash
gh extension install JoshLuedeman/gh-teamwork
```

## Usage

```
gh teamwork <subcommand> [flags]

SUBCOMMANDS
  init        Initialize Teamwork: fetch framework files and create config
  update      Update Teamwork framework files
  doctor      Check project setup and environment health
  validate    Validate config, state, handoffs, and memory

FLAGS (init)
  --source          Source repo (default: joshluedeman/teamwork)
  --ref             Git ref to install from (default: main)
  --force           Re-fetch framework files / overwrite user-modified files
  --preset          Use a preset config for a specific stack (e.g., go-api, ts-react)
  --non-interactive Skip the interactive setup wizard

FLAGS (update)
  --source          Source repo (default: joshluedeman/teamwork)
  --ref             Git ref to update from (default: main)
  --force           Overwrite user-modified files
  --check           Dry-run: check for drift without writing changes
  --create-issue    Create a GitHub issue for unfilled placeholders (default: true)
  --no-create-issue Skip GitHub issue creation for unfilled placeholders

FLAGS (validate)
  --ci              Machine-readable PASS/FAIL output for CI pipelines
```

## Quick Start

```bash
# In any new or existing repo
gh teamwork init
```

This sets up a complete Teamwork project in one step:

- `MEMORY.md` — Project context for AI agents
- `.teamwork/config.yaml` — Project configuration (models, roles, quality gates)
- `.github/agents/` — Custom Agents (selectable from Copilot's dropdown)
- `.github/skills/` — Skills (invocable via `/skill-name` in Copilot)
- `.github/instructions/` — Path-specific auto-loaded guidelines
- `docs/` — Conventions, architecture decisions, and glossary

## Requirements

The extension automatically handles finding or installing the `teamwork` binary:

1. **Installed binary** — uses `teamwork` if it's already on your PATH
2. **Auto-download** — downloads the latest release binary to `~/.local/bin/` if not found
3. **Docker fallback** — uses Docker as a last resort if download fails
4. **Clear error** — if none of the above work, shows install options

## Advanced Usage

Initialize with a preset for your stack:

```bash
gh teamwork init --preset go-api
```

Install from a fork or specific version:

```bash
gh teamwork init --source myorg/teamwork-fork --ref v1.2.0
```

Update framework files after a new Teamwork release:

```bash
gh teamwork update
```

Check for configuration drift without making changes (useful in CI):

```bash
gh teamwork update --check
```

Force-overwrite files you've modified:

```bash
gh teamwork update --force
```

Update without creating a GitHub issue for unfilled placeholders:

```bash
gh teamwork update --no-create-issue
```

Check project health and environment setup:

```bash
gh teamwork doctor
```

Validate project structure (machine-readable output for CI):

```bash
gh teamwork validate --ci
```

## Version Alignment

This extension is versioned in lockstep with the [Teamwork CLI](https://github.com/JoshLuedeman/teamwork). Both repositories share the same version tag (e.g., `v1.7.0`) to ensure compatibility. See `docs/releasing.md` in the Teamwork repo for the dual-repo release process.

## License

MIT

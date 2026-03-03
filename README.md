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
  init        Install Teamwork into the current directory
  update      Update Teamwork framework files

FLAGS
  --source    Source repo (default: JoshLuedeman/teamwork)
  --ref       Git ref to install from (default: main)
  --force     Overwrite user-modified framework files
```

## Quick Start

```bash
# In any new or existing repo
gh teamwork init
```

This installs the Teamwork framework files into the current directory, giving you:

- `MEMORY.md` — Project context for AI agents
- `agents/roles/` — Role definitions (planner, architect, coder, etc.)
- `agents/workflows/` — Step-by-step workflow guides
- `docs/` — Conventions, architecture decisions, and glossary

## Requirements

Either the `teamwork` binary must be installed, or Docker must be available as a fallback.

To install the `teamwork` binary directly, see the [Teamwork releases](https://github.com/JoshLuedeman/teamwork/releases).

## Advanced Usage

Install from a fork or specific version:

```bash
gh teamwork init --source myorg/teamwork-fork --ref v1.2.0
```

Update framework files after a new Teamwork release:

```bash
gh teamwork update
```

Force-overwrite files you've modified:

```bash
gh teamwork update --force
```

## License

MIT

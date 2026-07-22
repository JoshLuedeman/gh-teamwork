#!/usr/bin/env bash
#
# setup-hve-core.sh
#
# Shared, best-effort installer for the GitHub Copilot CLI and the
# hve-core-all plugin (from github.com/microsoft/hve-core).
#
# This script is intentionally NON-FATAL and idempotent: it is used by both
# the Copilot cloud-sandbox setup workflow (.github/workflows/copilot-setup-steps.yml)
# and the dev container (postCreateCommand). The sandbox / container MUST still
# start successfully even if any step here fails, so every risky command is
# guarded with `|| echo "::warning::..."` and the script always exits 0.
#
set -euo pipefail

echo "==> Installing GitHub Copilot CLI + hve-core-all plugin (best-effort)"

# 1. Copilot CLI — install only if it is not already on PATH (idempotent).
if command -v copilot >/dev/null 2>&1; then
  echo "==> copilot CLI already present: $(command -v copilot)"
else
  echo "==> copilot CLI not found; installing via npm..."
  npm install -g @github/copilot || echo "::warning::copilot CLI install failed"
fi

# 2. Add the microsoft/hve-core plugin marketplace.
copilot plugin marketplace add microsoft/hve-core || echo "::warning::marketplace add failed"

# 3. Install the hve-core-all plugin from that marketplace.
copilot plugin install hve-core-all@hve-core || echo "::warning::hve-core-all install failed"

# 4. List installed plugins for visibility (never fatal).
copilot plugin list || true

echo "==> hve-core setup complete (best-effort)"

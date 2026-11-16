#!/bin/sh
# Install Claude Code with Anthropic's native installer, which keeps it updated.
set -eu
if [ ! -x "${HOME}/.local/bin/claude" ]; then
  curl -fsSL https://claude.ai/install.sh | bash
fi

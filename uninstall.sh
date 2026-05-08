#!/usr/bin/env bash
set -euo pipefail

# Agent Stack — AI 工具卸载
# Usage: bash uninstall.sh

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; NC='\033[0m'
log()  { echo -e "${GREEN}[+]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err()  { echo -e "${RED}[-]${NC} $1"; exit 1; }

echo "Agent Stack — AI 工具卸载"

# Claude Code
if npm list -g @anthropic-ai/claude-code &>/dev/null; then
  log "Uninstalling Claude Code..."
  npm uninstall -g @anthropic-ai/claude-code
else
  warn "Claude Code not found, skip"
fi

# cc-switch
if pacman -Q cc-switch-bin &>/dev/null; then
  log "Uninstalling cc-switch..."
  sudo pacman -R cc-switch-bin
else
  warn "cc-switch not found, skip"
fi

log "Done."

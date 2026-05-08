#!/usr/bin/env bash
set -euo pipefail

# Agent Stack — AI 工具安装
# Usage: bash install.sh

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[0;33m'; NC='\033[0m'
log()  { echo -e "${GREEN}[+]${NC} $1"; }
warn() { echo -e "${YELLOW}[!]${NC} $1"; }
err()  { echo -e "${RED}[-]${NC} $1"; exit 1; }

echo "Agent Stack — AI 工具安装"

# Node.js
if command -v node &>/dev/null; then
  log "Node.js $(node -v) — OK"
else
  err "Node.js not found. Install >=22 first (pacman -S nodejs / nvm / fnm)"
fi

# Claude Code
if command -v claude &>/dev/null; then
  log "Claude Code $(claude --version 2>&1 | head -1) — already installed"
else
  log "Installing Claude Code..."
  npm install -g @anthropic-ai/claude-code
  log "Claude Code installed"
fi

# cc-switch — 大模型 API 配置切换器
# https://github.com/farion1231/cc-switch
if command -v cc-switch &>/dev/null; then
  log "cc-switch $(pacman -Q cc-switch-bin 2>/dev/null | awk '{print $2}') — already installed"
else
  log "Installing cc-switch..."
  yay -S --noconfirm cc-switch-bin || {
    warn "yay failed. Manual: https://github.com/farion1231/cc-switch/releases"
  }
fi

# Playwright MCP — Claude Code 的 headless Chromium 集成
# https://github.com/microsoft/playwright-mcp
if command -v playwright-mcp &>/dev/null; then
  log "playwright-mcp already installed"
else
  log "Installing Playwright MCP..."
  mkdir -p "$HOME/.local"

  # Arch chromium 替代 Playwright 自带的 Chrome-for-Testing（避免 GitHub CDN 限速）
  if ! command -v chromium &>/dev/null; then
    sudo pacman -S --noconfirm chromium || warn "chromium install failed; install manually"
  fi

  npm install -g --prefix "$HOME/.local" @playwright/mcp@latest

  if command -v playwright-mcp &>/dev/null; then
    log "playwright-mcp installed to $HOME/.local/bin"
  else
    warn "playwright-mcp install may have failed"
  fi
fi

# 注册 Playwright MCP 到 Claude Code（用户级）
if command -v claude &>/dev/null && command -v playwright-mcp &>/dev/null; then
  if claude mcp get playwright &>/dev/null 2>&1; then
    log "MCP playwright already registered"
  else
    log "Registering playwright MCP server (user scope)..."
    claude mcp add --scope user playwright -- \
      playwright-mcp \
      --headless \
      --isolated \
      --executable-path /usr/bin/chromium
    log "MCP playwright registered (restart Claude Code to load)"
  fi
fi

log "Done."

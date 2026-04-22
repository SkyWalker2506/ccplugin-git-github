#!/usr/bin/env bash
set -euo pipefail

PLUGIN_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$PLUGIN_DIR/skills/git-github"
SKILL_DEST="${HOME}/.claude/skills/git-github"

echo "=== ccplugin-git-github installer ==="
echo ""

# $HOME guard
if [[ -z "${HOME:-}" ]]; then
  echo "ERROR: \$HOME is not set. Aborting." >&2
  exit 1
fi

# Dependency checks
echo "Checking dependencies..."
MISSING_DEPS=()

if ! command -v git &>/dev/null; then
  MISSING_DEPS+=("git")
fi

if ! command -v node &>/dev/null; then
  MISSING_DEPS+=("node (required for GitHub MCP server)")
fi

if ! command -v npx &>/dev/null; then
  MISSING_DEPS+=("npx (comes with node)")
fi

if ! command -v uvx &>/dev/null && ! command -v uv &>/dev/null; then
  MISSING_DEPS+=("uv/uvx (required for Git MCP server — install: curl -LsSf https://astral.sh/uv/install.sh | sh)")
fi

if ! command -v gh &>/dev/null; then
  MISSING_DEPS+=("gh CLI (optional but recommended — install: brew install gh)")
fi

if [[ ${#MISSING_DEPS[@]} -gt 0 ]]; then
  echo ""
  echo "WARNING: The following dependencies are missing:"
  for dep in "${MISSING_DEPS[@]}"; do
    echo "  - $dep"
  done
  echo ""
fi

# Symlink check
if [[ -L "$SKILL_DEST" ]]; then
  echo "ERROR: $SKILL_DEST is a symlink. Refusing to install over a symlink." >&2
  exit 1
fi

# Install skill
echo "Installing skill..."
mkdir -p "$SKILL_DEST"

# Backup if exists
if [[ -d "$SKILL_DEST" ]] && [[ -f "$SKILL_DEST/SKILL.md" ]]; then
  BACKUP_PATH="${SKILL_DEST}.backup.$(date +%Y%m%d_%H%M%S)"
  echo "  Existing skill found — backing up to $BACKUP_PATH"
  cp -r "$SKILL_DEST" "$BACKUP_PATH"
fi

cp -r "$SKILL_SRC/." "$SKILL_DEST/"
echo "  Skill installed to: $SKILL_DEST"

# Check .mcp.json
if [[ -f "$PLUGIN_DIR/.mcp.json" ]]; then
  PAT=$(python3 -c "
import json, sys
try:
    d = json.load(open('$PLUGIN_DIR/.mcp.json'))
    env = d.get('mcpServers',{}).get('github',{}).get('env',{})
    print(env.get('GITHUB_PERSONAL_ACCESS_TOKEN',''))
except: print('')
" 2>/dev/null || echo "")
  if [[ -z "$PAT" ]]; then
    echo ""
    echo "ACTION REQUIRED: Set your GitHub PAT in .mcp.json"
    echo "  Template: $PLUGIN_DIR/.mcp.json.template"
    echo "  Required scopes: repo, read:org, read:user"
    echo "  Get your PAT: https://github.com/settings/tokens"
  fi
fi

echo ""
echo "=== Installation complete ==="
echo ""
echo "Next steps:"
echo "  1. Copy .mcp.json.template to .mcp.json and set your GITHUB_PERSONAL_ACCESS_TOKEN"
echo "  2. Run /repo-setup in Claude Code to verify your environment"
echo ""
echo "Skill active in Claude Code: /git-github"
echo "Commands: /pr-create, /repo-setup, /git-init, /git-sync"

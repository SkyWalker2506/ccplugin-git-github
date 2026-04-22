#!/usr/bin/env bash
set -euo pipefail

# $HOME guard
if [[ -z "${HOME:-}" ]]; then
  echo "ERROR: \$HOME is not set. Aborting to prevent accidental deletion." >&2
  exit 1
fi

SKILL_DIR="${HOME}/.claude/skills/git-github"

echo "=== ccplugin-git-github uninstaller ==="
echo ""

# Path validation
if [[ ! "$SKILL_DIR" == "${HOME}/.claude/skills/git-github" ]]; then
  echo "ERROR: Unexpected path: $SKILL_DIR. Aborting." >&2
  exit 1
fi

# Symlink: remove only the link
if [[ -L "$SKILL_DIR" ]]; then
  echo "WARNING: $SKILL_DIR is a symlink. Removing symlink only."
  rm "$SKILL_DIR"
  echo "Symlink removed."
  exit 0
fi

if [[ ! -d "$SKILL_DIR" ]]; then
  echo "Skill not found at $SKILL_DIR — nothing to uninstall."
  exit 0
fi

echo "This will remove: $SKILL_DIR"
read -r -p "Are you sure? [y/N] " confirm
if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 0
fi

rm -rf "$SKILL_DIR"
echo ""
echo "=== Uninstall complete ==="
echo "Skill removed from: $SKILL_DIR"

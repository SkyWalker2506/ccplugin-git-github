# git-github — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Claude Code plugin for Git + GitHub MCP integration.

## Install

```bash
claude plugin install git-github@musabkara-claude-marketplace
```

## What it does

Provides two MCP servers and associated skills/commands for seamless Git and GitHub workflows inside Claude Code:

- **GitHub MCP** (`@modelcontextprotocol/server-github`) — Full GitHub API: issues, PRs, repos, branches, code search, reviews, file management
- **Git MCP** (`mcp-server-git`) — Local git operations: status, diff, log, commit, branch, checkout, reset

## Commands

| Command | Description |
|---------|-------------|
| `/pr-create` | Create a pull request from the current branch |
| `/repo-setup` | Check gh auth, PAT token, git config, MCP server health |

## Worktree Workflow

Use git worktrees for parallel development and safe experimentation:

- **Risky refactors** — `/branch` to fork your session before major changes
- **Sub-agents** — Run agents in isolated worktrees so they don't touch the main branch
- **Parallel features** — Multiple Claude sessions on the same repo without conflicts

Claude Code has built-in worktree support — start a session with the worktree option or use `/branch` to fork mid-session.

## Setup

1. Install the plugin in your Claude Code project
2. Set your GitHub Personal Access Token in `.mcp.json` or `~/.claude/secrets/secrets.env`
3. Run `/repo-setup` to verify everything is configured

## Requirements

- `gh` CLI (GitHub CLI) — for PR creation and auth
- `node`/`npm` — for GitHub MCP server (`npx`)
- `uv`/`uvx` — for Git MCP server (`uvx`)
- Git configured with `user.name` and `user.email`

## License

MIT

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (110 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 14 plugins

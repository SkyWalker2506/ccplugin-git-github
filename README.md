# git-github — Claude Code Plugin

by [Musab Kara](https://linkedin.com/in/musab-kara-85580612a) · [GitHub](https://github.com/SkyWalker2506)

Claude Code plugin for Git + GitHub MCP integration.

## Install

```bash
# From source
git clone https://github.com/SkyWalker2506/ccplugin-git-github
cd ccplugin-git-github
./install.sh

# Or via marketplace
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

## Skill: `git-github`

The `git-github` skill auto-activates when you mention git, github, PR, branch, commit, diff, merge, clone, push, or review.

**GitHub MCP tools:** create/list/get/update issues, create/merge/review PRs, manage repos, branches, files, code search.

**Git MCP tools:** status, diff (staged/unstaged), log, commit, add, reset, checkout, branch, create-branch.

## Worktree Workflow

Use git worktrees for parallel development and safe experimentation:

- **Risky refactors** — `/branch` to fork your session before major changes
- **Sub-agents** — Run agents in isolated worktrees so they don't touch the main branch
- **Parallel features** — Multiple Claude sessions on the same repo without conflicts

## Quick Start

```bash
./install.sh
cp .mcp.json.template .mcp.json
# Edit .mcp.json — set GITHUB_PERSONAL_ACCESS_TOKEN
# In Claude Code: /repo-setup
```

## GitHub PAT — Required Scopes

Get your token: https://github.com/settings/tokens

| Scope | Reason |
|-------|--------|
| `repo` | Full repository access (create, push, PRs, issues) |
| `read:org` | Read organization membership |
| `read:user` | Read user profile |

Minimum for read-only: `public_repo` + `read:user`.
Fine-grained token: Contents (R/W), Issues (R/W), Pull requests (R/W), Metadata (R).

## Requirements

- `git` — version control
- `node`/`npm` — for GitHub MCP server
- `uv`/`uvx` — for Git MCP server (`curl -LsSf https://astral.sh/uv/install.sh | sh`)
- `gh` CLI — optional but recommended for fallback operations
- Git configured with `user.name` and `user.email`

## License

MIT

## Part of

- [claude-config](https://github.com/SkyWalker2506/claude-config) — Multi-Agent OS for Claude Code (134 agents, local-first routing)
- [Plugin Marketplace](https://github.com/SkyWalker2506/claude-marketplace) — Browse & install all 18 plugins
- [ClaudeHQ](https://github.com/SkyWalker2506/ClaudeHQ) — Claude ecosystem HQ

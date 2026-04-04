# ccplugin-git-github

Claude Code plugin for Git + GitHub MCP integration.

## What it does

Provides two MCP servers and associated skills/commands for seamless Git and GitHub workflows inside Claude Code:

- **GitHub MCP** (`@modelcontextprotocol/server-github`) — Full GitHub API: issues, PRs, repos, branches, code search, reviews, file management
- **Git MCP** (`mcp-server-git`) — Local git operations: status, diff, log, commit, branch, checkout, reset

## Structure

```
.claude-plugin/plugin.json   Plugin metadata
.mcp.json                    MCP server definitions
skills/git-github/SKILL.md   Auto-trigger skill with full capability reference
commands/pr-create.md         Create PR from current branch
commands/repo-setup.md        Verify git/github environment setup
```

## Setup

1. Install the plugin in your Claude Code project
2. Set your GitHub Personal Access Token in `.mcp.json` or `~/.claude/secrets/secrets.env`
3. Run `/repo-setup` to verify everything is configured

## Requirements

- `gh` CLI (GitHub CLI) — for PR creation and auth
- `node`/`npm` — for GitHub MCP server (`npx`)
- `uv`/`uvx` — for Git MCP server (`uvx`)
- Git configured with `user.name` and `user.email`

## Commands

| Command | Description |
|---------|-------------|
| `/pr-create` | Create a pull request from the current branch |
| `/repo-setup` | Check gh auth, PAT token, git config, MCP server health |

## License

MIT

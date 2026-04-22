# /repo-setup

Verify and configure Git + GitHub environment for this project.

## Trigger

`/repo-setup`, `/setup`, "setup git", "setup github"

## Steps

### 1. Check gh CLI authentication

```bash
gh auth status
```

- If not authenticated: run `gh auth login` and guide user
- Verify the correct account is active

### 2. Check GITHUB_PERSONAL_ACCESS_TOKEN

- Look in `.mcp.json` for the `github` server config
- If token is empty: warn user to set it
- Token can be set in:
  - `.mcp.json` directly (project-level, do NOT commit)
  - `~/.claude/secrets/secrets.env` as `GITHUB_PERSONAL_ACCESS_TOKEN=ghp_...`
  - Environment variable

**Required PAT scopes (classic token):**
| Scope | Reason |
|-------|--------|
| `repo` | Full repository access (create, push, PRs, issues) |
| `read:org` | Read organization membership |
| `read:user` | Read user profile |

**Minimum scopes for read-only:**
- `public_repo` — public repos only
- `read:user` — user info

**Create token:** https://github.com/settings/tokens → "Generate new token (classic)"

**Fine-grained token alternative:** GitHub Settings → Developer settings → Fine-grained tokens
- Repository access: selected repos or all
- Permissions: Contents (R/W), Issues (R/W), Pull requests (R/W), Metadata (R)

### 3. Check git config

```bash
git config user.name
git config user.email
```

- If missing: prompt user to set them
- Verify remote is configured: `git remote -v`

### 4. Verify MCP servers

- Check `npx -y @modelcontextprotocol/server-github` is accessible
- Check `uvx mcp-server-git` is accessible
- Report any missing dependencies (node/npm for github, uv/uvx for git)

### 5. Summary

Output a status table:

```
Git + GitHub Setup Status:
  gh auth:     OK / MISSING
  PAT token:   OK / EMPTY
  git user:    OK / MISSING
  git remote:  OK / MISSING
  github MCP:  OK / ERROR
  git MCP:     OK / ERROR
```

## Notes

- Never print actual token values — only report OK/EMPTY/MISSING
- If everything is OK, confirm ready to use
- If issues found, provide fix commands for each

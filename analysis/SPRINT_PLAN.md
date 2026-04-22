# ccplugin-git-github — Sprint Plan
> Generated: 2026-04-22 | Based on: MASTER_ANALYSIS.md

---

## Sprint 1 — Foundation

**Goal:** Make the plugin installable with guided setup.
**Time estimate:** 2-3 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 1.1 | Add install.sh | `install.sh` | Dep check + skill copy + next steps |
| 1.2 | Add uninstall.sh | `uninstall.sh` | Safety guards + confirmation |
| 1.3 | Add .mcp.json.template | `.mcp.json.template` | PAT placeholder + scope comments |
| 1.4 | Improve /repo-setup with PAT scope guide | `commands/repo-setup.md` | Add required scopes list |

---

## Sprint 2 — Commands & Workflows

**Goal:** Cover end-to-end Git workflows.
**Time estimate:** 3-4 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 2.1 | Add /git-init command | `commands/git-init.md` | New repo setup end-to-end |
| 2.2 | Add /git-sync command | `commands/git-sync.md` | Sync branch with main |
| 2.3 | Add feature branch workflow to SKILL.md | `skills/git-github/SKILL.md` | End-to-end pattern |
| 2.4 | Add stash + rebase patterns to SKILL.md | `skills/git-github/SKILL.md` | CLI fallback patterns |

---

## Sprint 3 — Polish

**Goal:** Discoverability and documentation.
**Time estimate:** 1-2 hours

| # | Task | File(s) | Action |
|---|------|---------|--------|
| 3.1 | Add PAT scope requirements to README | `README.md` | Required and optional scopes |
| 3.2 | Add CHANGELOG | `CHANGELOG.md` | Version history |
| 3.3 | GitHub topics | GitHub repo | git, github, claude-code, mcp, developer-tools |

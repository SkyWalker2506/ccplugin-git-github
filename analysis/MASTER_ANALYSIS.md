# ccplugin-git-github — Master Analysis Report
> Generated: 2026-04-22 | Categories: 5 | Mode: Lead Orchestrator

---

## Executive Summary

- **Overall score: 5.0/10**
- **Strongest area:** Core MCP Coverage (#1) — 8/10; both MCP servers are well-documented with full tool tables
- **Weakest area:** Setup Experience (#4) — 2.5/10; no install.sh, no PAT setup guidance, MCP requires manual config
- **Critical action count: 11**

The plugin's core value proposition is genuinely excellent: pairing Git MCP (local ops) with GitHub MCP (remote ops) covers the entire Git workflow without leaving Claude Code. The SKILL.md is comprehensive and well-structured. The gap is entirely in the developer experience layer: no install script, no automated PAT configuration, no guidance for first-time setup, and only 2 commands (neither of which helps you get started from zero).

---

## Score Card

| # | Category | Score | Critical Gaps | Improvement Potential |
|---|----------|-------|---------------|----------------------|
| 1 | Core Skill & MCP Coverage | 8.0/10 | 2 | Low — already comprehensive |
| 2 | Command Quality | 5.0/10 | 3 | High — add /git-init, /git-sync |
| 3 | Workflow Patterns | 5.5/10 | 2 | Medium — add rebase, stash patterns |
| 4 | Setup Experience | 2.5/10 | 4 | Critical — zero install automation |
| 5 | Documentation & Discoverability | 5.0/10 | 2 | Medium — topics missing, no demo |

**Weighted Average: 5.0/10**

---

## Category Analysis

### #1 — Core Skill & MCP Coverage (8/10)

SKILL.md has excellent MCP tool coverage for both GitHub and Git servers. Workflow section covers Create PR, Review PR, and Issue Triage — the three most common use cases. "Prefer MCP tools over CLI" guideline is correct and important.

**Gaps:**
- No mention of `git_rebase` (not in MCP, needs CLI fallback)
- No `git_stash` pattern (also CLI-only — needs explicit fallback note)
- `git_show` usage not demonstrated (when to use vs `git_log`)

---

### #2 — Command Quality (5/10)

`/pr-create` and `/repo-setup` are functional but:
- `/pr-create` checks status but does NOT use MCP tools — it falls back to `gh pr create` CLI
- `/repo-setup` only checks deps but doesn't fix anything
- No command for common workflows: sync main, clean branches, resolve conflicts
- No `/git-init` for setting up a new repo from scratch
- No `/git-sync` for keeping feature branch up to date with main

**Missing commands:**
- `/git-init` — initialize repo, add remote, push first commit
- `/git-sync` — fetch + rebase/merge main into current branch
- `/git-clean` — delete merged branches, prune remote tracking refs

---

### #3 — Workflow Patterns (5.5/10)

The three documented workflows (Create PR, Review PR, Issue Triage) are good. Missing:

- **Feature branch workflow** — create branch → work → sync → PR (end-to-end)
- **Hotfix workflow** — fork from main, quick fix, fast PR
- **Stash workflow** — stash, switch, apply (all CLI, needs explicit note)
- **Rebase workflow** — interactive rebase is CLI-only, no guidance

---

### #4 — Setup Experience (2.5/10)

This is the critical gap. No `install.sh` exists. To use the plugin:
1. Clone repo
2. Manually copy SKILL.md to `~/.claude/skills/git-github/`
3. Find and configure `.mcp.json` (no template provided)
4. Get GitHub PAT (no guidance for scopes needed)
5. Run `/repo-setup` to verify

Steps 2-4 are completely undocumented. The `.mcp.json` in the plugin repo appears to have a blank PAT. There's no `.mcp.json.template`.

---

### #5 — Documentation & Discoverability (5/10)

README is solid — has tool tables, commands, requirements. Missing:
- GitHub topics: `git`, `github`, `claude-code`, `mcp`, `developer-tools`
- Demo/example showing MCP in action
- PAT scope requirements (what permissions needed)
- CHANGELOG

---

## Top 11 Priority Actions

| # | Action | Category | Impact | Effort | Priority |
|---|--------|----------|--------|--------|----------|
| 1 | Add install.sh with skill copy + dep check | Setup | High | S | P0 |
| 2 | Add uninstall.sh with $HOME guard | Setup | High | S | P0 |
| 3 | Add .mcp.json.template with PAT placeholder + scope docs | Setup | High | S | P0 |
| 4 | Add GitHub PAT scope guide to /repo-setup command | Setup | High | S | P0 |
| 5 | Add /git-init command — new repo scaffolding | Commands | High | M | P1 |
| 6 | Add /git-sync command — sync branch with main | Commands | High | S | P1 |
| 7 | Add feature branch workflow to SKILL.md | Workflow | Medium | S | P1 |
| 8 | Add stash + rebase CLI fallback patterns to SKILL.md | Workflow | Medium | S | P1 |
| 9 | Add GitHub topics: git, github, claude-code, mcp, developer-tools | Discoverability | High | S | P1 |
| 10 | Add README section: "PAT token — required scopes" | Docs | High | S | P1 |
| 11 | Add CHANGELOG | Docs | Low | S | P2 |

---

## Sprint Roadmap

### Sprint 1 — Foundation (install + templates)
P0 items: install.sh, uninstall.sh, .mcp.json.template, PAT scope guide.
After this sprint the plugin is installable without reading source code.

### Sprint 2 — Commands + Workflows
P1 items: /git-init, /git-sync, feature branch workflow, stash/rebase patterns.
After this sprint the plugin covers end-to-end Git workflows.

### Sprint 3 — Polish (discoverability + docs)
P1-P2 items: GitHub topics, PAT docs in README, CHANGELOG.
After this sprint plugin is marketplace-ready.

### Target Scores (post Sprint 3)
| Category | Current | Target |
|----------|---------|--------|
| Core Skill | 8.0 | 8.5 |
| Command Quality | 5.0 | 8.0 |
| Workflow Patterns | 5.5 | 8.0 |
| Setup Experience | 2.5 | 7.5 |
| Documentation | 5.0 | 7.5 |
| **Average** | **5.0** | **7.9** |

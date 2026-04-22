# Changelog

## [1.1.0] - 2026-04-22

### Added
- `install.sh` — dependency check, skill installation, backup mechanism, PAT guidance
- `uninstall.sh` — safe removal with `$HOME` guard and confirmation prompt
- `.mcp.json.template` — pre-filled template with PAT placeholder
- `/git-init` command — scaffold new repo end-to-end (init, .gitignore, GitHub create, push)
- `/git-sync` command — sync branch with main (fetch + rebase/merge, stash handling, conflict guidance)
- SKILL.md: Feature branch workflow (end-to-end pattern)
- SKILL.md: Stash workflow (CLI-only — MCP has no stash tool)
- SKILL.md: Rebase workflow (CLI-only, with `--force-with-lease` guidance)
- SKILL.md: Hotfix workflow
- `/repo-setup`: PAT scope requirements table (classic + fine-grained)
- README: Quick start section
- README: GitHub PAT required scopes table
- CHANGELOG

## [1.0.0] - 2026-04-04

### Added
- Initial release
- GitHub MCP server integration (issues, PRs, repos, branches, code search, reviews)
- Git MCP server integration (status, diff, log, commit, branch, checkout, reset)
- `git-github` skill with auto-triggers
- `/pr-create` command
- `/repo-setup` command

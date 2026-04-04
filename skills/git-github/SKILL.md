# Git + GitHub Skill

## Trigger

Auto-activate when user mentions: git, github, PR, pull request, issue, branch, commit, diff, merge, clone, push, repo, repository, review.

## MCP Servers

This plugin provides two MCP servers for complete Git + GitHub workflow coverage.

### 1. GitHub MCP (`@modelcontextprotocol/server-github`)

Full GitHub API integration via MCP. Capabilities:

**Issues**
- `create_issue` — create new issue with title, body, labels, assignees
- `list_issues` — list issues for a repository with filters (state, labels, assignee)
- `get_issue` — get issue details by number
- `update_issue` — update issue title, body, state, labels, assignees
- `add_issue_comment` — add comment to an issue
- `search_issues` — search issues across repositories

**Pull Requests**
- `create_pull_request` — create PR with title, body, head, base branch
- `list_pull_requests` — list PRs with filters (state, head, base)
- `get_pull_request` — get PR details by number
- `get_pull_request_files` — list files changed in a PR
- `get_pull_request_comments` — get PR review comments
- `get_pull_request_reviews` — get PR reviews
- `get_pull_request_status` — get PR CI/check status
- `create_pull_request_review` — submit a PR review (approve, comment, request changes)
- `merge_pull_request` — merge a PR (merge, squash, or rebase)
- `update_pull_request_branch` — update PR branch with base branch

**Repositories**
- `create_repository` — create new repo (public/private)
- `search_repositories` — search repos by query
- `fork_repository` — fork a repository
- `get_file_contents` — read file or directory contents from a repo
- `create_or_update_file` — create or update a file in a repo
- `push_files` — push multiple files in a single commit

**Branches**
- `create_branch` — create branch from a ref
- `list_commits` — list commits on a branch

**Users**
- `search_users` — search GitHub users

**Code Search**
- `search_code` — search code across GitHub repositories

### 2. Git MCP (`mcp-server-git`)

Local git repository operations via MCP. Capabilities:

- `git_status` — show working tree status (staged, unstaged, untracked files)
- `git_diff` — show full diff of all changes
- `git_diff_staged` — show diff of staged changes only
- `git_diff_unstaged` — show diff of unstaged changes only
- `git_log` — show commit log with optional max count
- `git_branch` — list all branches
- `git_show` — show contents of a specific commit
- `git_commit` — create a commit with a message
- `git_add` — stage files for commit
- `git_reset` — unstage files
- `git_checkout` — switch branches or restore files
- `git_create_branch` — create and optionally checkout a new branch

## Usage Guidelines

1. **Prefer MCP tools** over `gh` CLI or `git` CLI when available
2. Use `git` MCP for local operations (status, diff, commit, branch)
3. Use `github` MCP for remote operations (issues, PRs, repo management)
4. Fall back to `gh` CLI for operations not covered by MCP (e.g., `gh auth status`, `gh run watch`)
5. Fall back to `git` CLI for operations not covered by MCP (e.g., `git rebase`, `git stash`)

## Common Workflows

### Create a PR
1. `git_status` — check current state
2. `git_add` — stage changes
3. `git_commit` — commit with conventional message
4. Push via CLI: `git push -u origin <branch>`
5. `create_pull_request` — open PR on GitHub

### Review a PR
1. `get_pull_request` — read PR details
2. `get_pull_request_files` — see changed files
3. `get_pull_request_comments` — check existing feedback
4. `create_pull_request_review` — submit review

### Issue Triage
1. `list_issues` — see open issues
2. `get_issue` — read issue details
3. `add_issue_comment` — respond or ask for info
4. `update_issue` — add labels, assign, close

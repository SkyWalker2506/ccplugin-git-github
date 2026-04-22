# /git-init

Initialize a new Git repository and connect it to GitHub.

## Trigger

`/git-init`, `/init-repo`, "initialize repo", "create repo", "new git project"

## Steps

### 1. Check current directory

```bash
git status
```

- If already a git repo: warn and ask if user wants to continue or abort
- If not: proceed

### 2. Gather info

Ask the user:
- Repository name (default: current directory name)
- Description (1 sentence)
- Visibility: public or private (default: private)
- License: MIT / Apache-2.0 / None (default: MIT)
- Initialize with README? (default: yes)

### 3. Initialize local repo

```bash
git init
git branch -M main
```

If README:
```bash
echo "# <repo-name>\n\n<description>" > README.md
git add README.md
git commit -m "chore: initial commit"
```

Add .gitignore if not present (offer common templates: node, python, flutter, etc.):
```bash
curl -o .gitignore https://raw.githubusercontent.com/github/gitignore/main/Node.gitignore
# or appropriate template
```

### 4. Create GitHub repository

Use `create_repository` MCP tool:
- name: `<repo-name>`
- description: `<description>`
- private: true/false
- auto_init: false (we already initialized locally)

### 5. Connect remote and push

```bash
git remote add origin https://github.com/<username>/<repo-name>.git
git push -u origin main
```

### 6. Output summary

```
Repository initialized:
  Local:   /path/to/repo
  Remote:  https://github.com/<username>/<repo-name>
  Branch:  main
  License: MIT
  Next:    git checkout -b feature/<name> to start working
```

## Notes

- Never commit `.env`, `secrets.env`, or credential files
- If GitHub PAT is not set, fall back to `gh repo create` CLI
- Add `.gitignore` before first commit if project type is known

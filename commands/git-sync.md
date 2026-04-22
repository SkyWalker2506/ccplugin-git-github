# /git-sync

Sync the current branch with the latest changes from the base branch (main).

## Trigger

`/git-sync`, "/sync", "sync with main", "update branch", "pull latest", "rebase on main"

## Steps

### 1. Check current state

```bash
git status
git branch --show-current
```

- If on `main`/`master`: pull latest, done
- If dirty (uncommitted changes): warn user — offer to stash first or abort

### 2. Stash if dirty (with user consent)

If uncommitted changes:
```
You have uncommitted changes. Options:
  a) Stash them, sync, then re-apply (recommended)
  b) Abort — commit your changes first
```

If a): `git stash push -m "auto-stash before sync $(date)"`

### 3. Fetch latest

```bash
git fetch origin main
```

### 4. Determine sync strategy

Ask only if not obvious:
```
Sync strategy:
  a) Rebase — cleaner history (default for feature branches)
  b) Merge — preserves branch history
```

Default: rebase.

### 5. Execute sync

Rebase:
```bash
git rebase origin/main
```

Merge:
```bash
git merge origin/main --no-edit
```

### 6. Handle conflicts

If conflicts:
1. List conflicting files using `git_diff_unstaged`
2. Show conflict markers for each file
3. Ask user to resolve manually or abort:
   - Rebase abort: `git rebase --abort`
   - Merge abort: `git merge --abort`
4. After resolution: `git rebase --continue` or `git commit`

### 7. Re-apply stash (if stashed)

```bash
git stash pop
```

If stash pop conflicts: notify user and list conflicting files.

### 8. Summary

```
Sync complete:
  Branch:        feature/my-feature
  Synced with:   origin/main (N commits ahead)
  Strategy:      rebase
  Stash:         restored
  Status:        clean
```

## Notes

- Never force-push main/master
- If branch was already pushed to remote, a push after rebase requires `git push --force-with-lease` (not `--force`) — warn user before doing this
- Use `git_status` and `git_diff` MCP tools to check state throughout

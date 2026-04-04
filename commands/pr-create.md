# /pr-create

Create a pull request from the current branch.

## Trigger

`/pr-create`, `/pr`, "create pr", "open pr"

## Steps

1. Run `git status` to check for uncommitted changes — warn if dirty
2. Get current branch name via `git branch --show-current`
3. Abort if on `main` or `master` — prompt user to create a feature branch first
4. Determine base branch (default: `main`)
5. Run `git log main..HEAD --oneline` to see commits being included
6. Run `git diff main...HEAD --stat` to see changed files summary
7. Push current branch: `git push -u origin <branch>`
8. Create PR using `gh pr create`:

```bash
gh pr create --title "<title>" --body "$(cat <<'EOF'
## Summary
<bullet points from commit analysis>

## Test plan
- [ ] <relevant test items>
EOF
)"
```

9. Output the PR URL

## Notes

- Title should be concise (<70 chars), following conventional commit style
- Body summarizes ALL commits in the branch, not just the latest
- If `gh auth status` fails, run `/repo-setup` first

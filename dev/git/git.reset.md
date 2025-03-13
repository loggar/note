# git reset

## Revert all the recent commits in a branch

If you don't want to create another commit and instead want to completely undo the merge as if it never happened, you'll need to use `git reset` and force push. Be aware that this rewrites history and can cause problems for others who have pulled your branch:

```bash
# Find the commit hash just before the merge
git log --oneline

# Reset your branch to that commit
git reset --hard <commit-hash-before-merge>

# Force push to overwrite the GitHub branch
git push -f origin your-branch-name
```

Important warnings:

- This removes the merge commit from history completely
- Anyone who has pulled your branch will have conflicts on their next pull
- This approach is generally not recommended for shared branches
- Some repositories may have branch protection rules preventing force pushes

If this is a personal branch that no one else is using, this approach is simpler. If it's a shared branch, consider using the revert approach instead to avoid disrupting others' work.

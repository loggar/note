# git squash

```
$ git log --pretty=oneline --abbrev-commit
c0c5c8e (HEAD -> master) feat (git) squash
eb7b757 feat (git) squash
595146b (origin/master) docs (linux) service status
...
```

```
git rebase -i HEAD~5
```

## Using squash when merging the branch

```
git merge --squash target_branch_name
```

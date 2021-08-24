# git branch

## change branch name from master to main

```
git branch -m master main

# if remote exists
git push -u origin main

# Point HEAD to ‘main’ branch
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main

# Delete ‘master’ branch on the remote repo
git push origin --delete master
```

list branch:

```
git branch -a
```

## Change git init default branch name

```
git config --global init.defaultBranch main
```

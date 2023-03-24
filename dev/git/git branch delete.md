## Delete Branch

### deleting local branches

```
git branch -d 'branch-name'
```

### deleting local branches without checking its merge status

```
git branch -D 'branch-name'
```

### deleting remote branches

```
git push origin --delete 'branch-name'
```

or delete local branch and apply it to remote

```
git branch -d <branch>
git push origin :<branch>
```

### delete all merged branch

```sh
#!/bin/bash

# Make sure you are on the main branch
git checkout main
git pull

# Delete all merged branches except for the main branch
git branch --merged | grep -v "\* main" | xargs -n 1 git branch -d

# Push the changes to the remote repository
git push --prune origin
```

```
chmod +x delete_merged_branches.sh
./delete_merged_branches.sh
```

## Delete Branch

### deleting local branches

```
git branch -d 'branch-name'
```

### deleting local branches without cheching its merge status

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

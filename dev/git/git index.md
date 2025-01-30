# git index

## assume unchanged

```
git update-index --assume-unchanged dir/someDifferentInCurrentLocal.go
```

Cancel assuming

```
git update-index --no-assume-unchanged dir/someDifferentInCurrentLocal.go
```

When you mark a file as "assume unchanged" using `git update-index --assume-unchanged`, Git will ignore changes to that file in your local working directory. However, if the file is changed in the remote repository (origin) and you pull those changes, Git will still update the file in your local repository with the changes from the remote.

In summary:
Your local changes to the file will be ignored by Git.
Changes from the remote repository will still be pulled and applied to the file in your local repository.

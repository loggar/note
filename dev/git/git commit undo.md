# Undo a commit

## undo a local commit

One way you can undo a commit locally is by using `git reset`. For example, if you want to undo the last commit made, you can run this command:

```
git reset --soft HEAD~1
```

The `--soft` flag preserves the changes you've made to the files you committed, only the commit is reverted. However, if you don't want to keep the changes made to the files, you can use the `--hard` flag instead like this:

```
git reset --hard HEAD~1
```

Note that you should use the `--hard` flag only when you are sure that you don't need the changes.

Also, note that `HEAD~1` points to the last commit. If you want to undo a commit before that, you can use `git reflog` to get a log of all previous commits. Then use the `git reset` command with the commit hash (the number you get at the beginning of each line of history). For example, if my commit hash is `9157b6910`, I'll do this

```
git reset --soft 9157b6910
```

## undo a remote commit

There are times you want to undo a commit you have pushed to a remote repository. You can use `git revert` to undo it locally and push this change to the remote branch.

First, get the commit hash using `git reflog`.

```
git reflog
```

Then revert it. Assuming my commit hash is `9157b6910`, I'll do the following:

```
git revert 9157b6910
```

Finally, push this change to the remote branch.

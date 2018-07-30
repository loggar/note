# git undo redo

## reference

| Command      | Scope        | Common use cases                                                     |
|--------------|--------------|----------------------------------------------------------------------|
| git reset    | Commit-level | Discard commits in a private branch or throw away uncommited changes |
| git reset    | File-level   | Unstage a file                                                       |
| git checkout | Commit-level | Switch between branches or inspect old snapshots                     |
| git checkout | File-level   | Discard changes in the working directory                             |
| git revert   | Commit-level | Undo commits in a public branch                                      |
| git revert   | File-level   | (N/A)                                                                |

## git commit list

```
$ git log
$ git log --stat
$ git log --pretty=oneline
$ git log --pretty=format:"%h - %an, %ar : %s"
```

## undo a local commit

```
git reset --soft HEAD^     # use --soft if you want to keep your changes
git reset --hard HEAD^     # use --hard if you don't care about keeping the changes you made
```

## Checkout old commits

```
git checkout hotfix
```

Unlike git reset, git checkout doesn’t move any branches around.

### Git Checkout File

```
git checkout HEAD~2 foo.py
```

Just like the commit-level invocation of git checkout, this can be used to inspect old versions of a project—but the scope is limited to the specified file.

## Reset A Specific Commit

```
git checkout hotfix
git reset HEAD~2
```

* `--soft` – The staged snapshot and working directory are not altered in any way.
* `--mixed` – The staged snapshot is updated to match the specified commit, but the working directory is not affected. This is the default option.
* `--hard` – The staged snapshot and the working directory are both updated to match the specified commit.

### Reset A Specific File

```
git reset HEAD~2 foo.py
```

The `--soft`, `--mixed`, and `--hard` flags do not have any effect on the file-level version of git reset, as the staged snapshot is always updated, and the working directory is never updated.

## Undo Public Commits with Revert

```
git checkout hotfix
git revert HEAD~2
```

`git revert HEAD` creates a new commit which will revert the changes you made in your previous commit (current HEAD)

```
git commit -m 'restoring the file I removed by accident'
git log
    commit 102: restoring the file I removed by accident
    commit 101: removing a file we don't need
    commit 100: adding a file that we need
```

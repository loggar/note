# git undo redo

## reference

| Command      | Scope        | Common use cases                                                     |
| ------------ | ------------ | -------------------------------------------------------------------- |
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

# throw away all local changes

get rid of all local changes

```
git fetch --all

git reset --hard origin/master
```

## remove a commit have been already pushed

```
$ git revert <commit-hash>
```

## Checkout old commits

```
git checkout <commit-hash>
```

Unlike git reset, git checkout doesn’t move any branches around.

Back to latest commit after checkout previous commit:

```
git checkout <branch-name>
```

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

- `--soft` – The staged snapshot and working directory are not altered in any way.
- `--mixed` – The staged snapshot is updated to match the specified commit, but the working directory is not affected. This is the default option.
- `--hard` – The staged snapshot and the working directory are both updated to match the specified commit.

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

## Remove a file you accidentally committed in your last commit (but haven’t pushed yet)

```
git reset --soft HEAD^1

git rm --cached <file-name>

git commit -m "my commit message"
```

The removed file or files can then be added into a separate commit.

## restore (bring back a file from git)

```
git restore path/to/file # discard current changes
git restore --staged path/to/file # unstage staged file
git restore --source [hash] path/to/file  ## restore from specific commit hash
```

### restore, revert, reset

- git-revert is about making a new commit that reverts the changes made by other commits.
- git-restore is about restoring files in the working tree from either the index or another commit. This command does not update your branch. The command can also be used to restore files in the index from another commit.
- git-reset is about updating your branch, moving the tip in order to add or remove commits from the branch. This operation changes the commit history. git reset can also be used to restore the index, overlapping with git restore.

Revert last merging commit:

```
git revert -m 1 <merge_commit_hash>
```

Reset the branch to a commit:

```
git reset --hard <the_commit_you_want_go_back_hash>

# come back to before-reset
# git pull
```

## Go back to previous commit and come back

```sh
# go back
git checkout <commit-id>
# come back to latest
git reset --hard origin/<branch-name>
```

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

## git redo after undo

after

```
git checkout
git reset
git merge
```

Git keeps track of updates to the tip of branches using a mechanism called reference logs, or "reflogs."

```
λ git reflog
cc35656 HEAD@{0}: commit: workspace setting eclipse
d79c8a9 HEAD@{1}: commit: workspace settings eclipse
810af46 HEAD@{2}: commit: git eclipse git repository sync with remote
86aadd5 HEAD@{3}: commit: readme
5a5d106 HEAD@{4}: commit: vscode launch jasmine test for this file
11cf09f HEAD@{5}: commit: vscode _launch_tasks_json
36cd864 HEAD@{6}: commit: package managers
ff64400 HEAD@{7}: pull --tags origin master: Merge made by the 'recursive' strategy.
c2355f4 HEAD@{8}: commit: centos firewall
940eae1 HEAD@{9}: pull --tags origin master: Merge made by the 'recursive' strategy.
c79d0c4 HEAD@{10}: commit: vscode _launch_tasks_json settings
fda81c0 HEAD@{11}: commit: vscode _launch_tasks_json
1a74854 HEAD@{12}: pull --tags origin master: Fast-forward
75922ef HEAD@{13}: pull: Merge made by the 'recursive' strategy.
250b778 HEAD@{14}: commit: tomcat hot-deploy dynamic-loading
5e46d26 HEAD@{15}: commit: mysql mariadb settings
4db04e1 HEAD@{16}: commit: mysql mariadb settings
f21cbf3 HEAD@{17}: commit: git errors
207d210 HEAD@{18}: pull origin master: Merge made by the 'recursive' strategy.
fdb521e HEAD@{19}: commit: gitignore
f7358ea HEAD@{20}: initial pull
```

reflog for other branch

```
git reflog show otherbranch
```

reflog for stash

```
git reflog stash
```

## Recovering lost commits

```
#make changes to HEAD
git commit -am "some WIP changes"
```

proceed undo it

```
git rebase -i origin/master
```

want redo it, show reflog

```
git reflog
```

recover it with HEAD-ID

```
git reset HEAD@{10}
```

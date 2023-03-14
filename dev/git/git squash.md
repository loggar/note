# git squash

```
$ git log --pretty=oneline --abbrev-commit
f67a8fb (HEAD -> master) feat (git) squash
c0c5c8e feat (git) squash
eb7b757 feat (git) squash
...
```

```
git rebase -i HEAD~3

git rebase -i <the_commit_id_before_target_commits>

git rebase --continue # continue rebase

git rebase --edit-todo # edit current rebase
```

```
pick eb7b757 feat (git) squash
s c0c5c8e feat (git) squash
s f67a8fb feat (git) squash

# Rebase 595146b..f67a8fb onto 595146b (3 commands)
#
# Commands:
# p, pick <commit> = use commit
# r, reword <commit> = use commit, but edit the commit message
# e, edit <commit> = use commit, but stop for amending
# s, squash <commit> = use commit, but meld into previous commit
# f, fixup <commit> = like "squash", but discard this commit's log message
# x, exec <command> = run command (the rest of the line) using shell
# b, break = stop here (continue rebase later with 'git rebase --continue')
# d, drop <commit> = remove commit
# l, label <label> = label current HEAD with a name
# t, reset <label> = reset HEAD to a label
# m, merge [-C <commit> | -c <commit>] <label> [# <oneline>]
# .       create a merge commit using the original merge commit's
# .       message (or the oneline, if no original merge commit was
# .       specified). Use -c <commit> to reword the commit message.
#
# These lines can be re-ordered; they are executed from top to bottom.
#
# If you remove a line here THAT COMMIT WILL BE LOST.
#
# However, if you remove everything, the rebase will be aborted
```

Save and exit `:wq`

```
# This is a combination of 3 commits.
# This is the 1st commit message:

feat (git) squash

# This is the commit message #2:

feat (git) squash

# This is the commit message #3:

feat (git) squash

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# Date:      Fri Jul 17 12:39:42 2020 +1000
#
# interactive rebase in progress; onto 595146b
# Last commands done (3 commands done):
#    squash c0c5c8e feat (git) squash
#    squash f67a8fb feat (git) squash
# No commands remaining.
# You are currently rebasing branch 'master' on '595146b'.
#
# Changes to be committed:
#       modified:   git/git log.md
```

```
$ git log --pretty=oneline --abbrev-commit
b89a4b5 (HEAD -> master) feat (git) squash
...
```

## Using squash when merging the branch

```
git merge --squash target_branch_name
```

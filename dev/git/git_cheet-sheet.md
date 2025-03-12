# git

## stage

show added files:

```
git diff --cached
git diff --name-only --cached
```

## branch

create new branch:

```
git checkout master
git pull origin master
git checkout -b <branch-name> master
```

```sh
# from a local branch
git checkout -b local/b1 feature/b1
git checkout -b feature/b2 main
```

push to upstream:

```sh
# new branch
git push -u origin feature/b1

# existing branch
git push origin feature/b1
```

delete:

```sh
# delete a local branch
git branch -d <branch-name>
# delete a local branch not fully merged
git branch -D <branch-name>
```

rename:

```sh
git branch -m new-branch-name
```

## remote

add remote

```
git init
git remote add origin git@bitbucket.org:a/b.git
git pull origin main
```

push with set upstream:

```
git push -u origin main
# or
git push --set-upstream origin main
```

## merge

merge from remote

```
git merge origin/main
```

## commit

```sh
git commit -m "msg"
```

## push

```
git push -u origin feature/b1
git push origin feature/b1
```

## commit message

amend message after push (latest commit):

```sh
git commit --amend -m "New message"

# Note that using --force is not recommended unless you are absolutely sure that no one else has cloned your repository after the latest commit.
git push --force repository-name branch-name

# safer
git push --force-with-lease repository-name branch-name
```

## log

what's changes in commits:

```
git log --raw
git log --patch
```

## abort merge

```
The answer marked correct here did not work for me as after you quit the editor with wq or :q!, the file gets saved and the merge happens.

The alternative, I've found for now is to suspend the vim process by using a Ctrl + Z and then aborting the merge with a git merge --abort and then killing the background process (you'll see the PID when you do the Ctrl + Z)
```

```
It depends on your editor. In vi and vi forks like vim, exiting by either saving (wq) or force exiting without saving (q!) will NOT prevent merge to continue. In order to stop merge to continue, you need to exit vim with an error.

Exit vim using cq! will prevent merge to happen.
```

## reset

locally go back to a certain old commit:

```
git reset --hard 4a155e5
```

if pushed:

```
git push -f origin <branch-name>
```

## log

log with file content:

```
git log --patch
```

## squash

```
git rebase -i HEAD~4
# pick oldest commit, squash other commits
# don't include merging activity

git push -f origin <branch>
```

rebase commands:

```
# open rebase todo
code .git/rebase-merge/git-rebase-todo
# same as
git rebase --edit-todo

# resume rebase
git rebase --continue

# abort rebase
git rebase --abort
```

## git interactive editor

open global setting

```
git config --global --edit
```

```
[core]
    editor = code --wait
```

or add to `PATH`

```
export PATH="$PATH:Applications/Visual Studio Code.app/Contents/Resources/app/bin"
```

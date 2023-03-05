## git stash

Let's say you are in the middle of implementing a new feature and you need to switch branches to fix a bug or revert back to where you started in the current branch. You do not want to commit half-done work or lose your changes. git stash is a handy feature for these types of situations. It takes your changes, saves them to a temporary place and cleans up your dorking directory. This allows you to switch to other branches or work elsewhere.

```
λ git status
```

stash current changes.

```
λ git stash save "Partial improvement of git tips"
Saved working directory and index state On master: Partial improvement of git tips
HEAD is now at 1a74854 git issues
```

you can stash multiple times. use "git stash list" command to see to list of stashes stored on the stash stack.

```
λ git stash list
stash@{0}: On master: Partial improvement of git tips
```

"git stash apply" restores the most recent save, to restore one of the older stashes, specify its name.

```
git stash apply
``

```
git stash apply stash@{2}
```

A stach could be applied to any branch not just the same branch it was saved form.

> Stash will ignore 'un-tracked' files. If you added a new file, you must first add it to the index using "git add" before stashing.

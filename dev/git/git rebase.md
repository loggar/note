# Rebase

## Interactive Rebase

I must admit, it is not an essential command for Git, but I use it often to organize my commits on a branch. I like to have a tidy branch before I open it as a PR for others. Tidying a branch means to bring commits in an order that makes sense, rewriting commit messages or “squashing” commit. To squash commits means to merge multiple commits into one.

When using an interactive rebase, you can decide how many commits you want to interactively adjust.

```
git rebase -i HEAD˜<number>
```

Afterward, since you adjusted the Git history, you need to force push your changes. A force push will overwrite the Git commits in your remote repository.

```
git push -f origin master
```

In general, you should be careful with force pushes. A good rule of thumb is that you can do them on a branch, but never on the master branch. In larger projects a force push is often programmatically not allowed on the master branch.

## Resolving Conflicts

Sometimes, when you pull the recent changes from a remote repository or when you rebase the master on a branch, you run into conflicts. Conflicts happen when Git cannot resolve multiple changes on the same file. That can happen more often than expected when collaborating with multiple people.

For instance, imagine it happens for a `git rebase master` on your branch. The command line would indicate that it stopped the rebase and shows you the conflicting files. That’s no reason to panic. You can open the indicated files and resolve the conflicts. In the file you should see the changes well separated: the changes from master (HEAD) and from your branch (usually the commit message). You have to decide which of both versions you want to take in order to resolve the conflict. After you have resolved all conflicts in all files (usually all files are shown on the command line), you can continue the rebase:

```
git add .
git rebase --continue
```

If you run again into conflicts, you can resolve them and run the commands again.

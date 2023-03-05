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
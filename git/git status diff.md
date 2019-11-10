## Git Status, Log and History

There a three essential git commands that give you a status of your project about current and recent changes. They don’t alter anything in your local repository but only show you information. For instance, whenever you want to check the local staged and unstaged changes, type:

```
git status
```

Whenever you want to see your local unstaged changes compared to the recent commit, type:

```
git diff
```

And whenever you want to see the git history of commits, type:

```
git log
```

The default `git log` is not helpful for most people. Each commit takes too much space and it is hard to scan the history. You can use the following configuration to setup a more concise alias:

```
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

Now you can use it with `git lg` instead of `git log`. Try it out to see the difference.
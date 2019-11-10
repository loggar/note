# Merge a Pull Request

At some point, you want to merge a branch to the master branch. You would use the GitHub interface to open a Pull Request (PR) before merging it. Pull Requests help to inspire discussions and peer reviews for an improved code quality and to share knowledge across collaborators.

Before opening a PR, I usually follow these steps to checkout the branch, get all the updates to merge them with my own, get all the recent changes from the master branch too, and force push all the changes to the branch itself.

First, when being on the master branch, update the master branch to the recent changes:

```
git pull --rebase origin master
```

Second, checkout the branch:

```
git checkout <branch>
```

If you have not the branch yet, fetch all the branches from the remote repository before and then checkout the branch:

```
git fetch
git checkout <branch>
```

Third, pull rebase all recent changes from the branch:

```
git pull --rebase origin <branch>
```

Fourth, rebase all the changes locally from the recent master branch on top:

```
git rebase master
```

Last but not least, force push all the changes to the remote branch:

```
git push -f origin <branch>
```

The branch is synced with changes from all collaborators, your changes and changes from the master branch. Finally, when the branch is updated in the remote repository, you can hit the “Merge Pull Request” button on GitHub.

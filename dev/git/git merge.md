# merge

## merge from other branch

```
git fetch
git merge origin/<other-branch-name>
```

## Merge a file from one branch to another

Sometimes, you may want to merge the content of a specific file in one branch into another. For example, you want to merge the content of a file `index.html` in the master branch of a project into the development branch. How can you do that?

First, checkout to the right branch (the branch you want to merge the file) if you've not already done so. In our case, it's the development branch.

```
git checkout development
```

Then merge the file using the checkout `--patch` command.

```
git checkout --patch master index.html
```

If you want to completely overwrite the `index.html` file on the development branch with the one on the master branch, you leave out the `--patch` flag.

```
git checkout master index.html
```

Also, leave out the `--patch` flag if the `index.html` file does not exist on the development branch.

## Merge a Pull Request

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
git push -u origin <branch>
```

The branch is synced with changes from all collaborators, your changes and changes from the master branch. Finally, when the branch is updated in the remote repository, you can hit the “Merge Pull Request” button on GitHub.

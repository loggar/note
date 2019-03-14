# git branch

## Branching

Git Branches are used for multiple use cases. Imagine you are working on a new feature for your project. You want to open a new branch for it to track the changes independently from the whole project, to be more specific: independently from the master branch. Before you merge the branch into your master branch, you (or others) can review the changes.

Another use case is when you work in a team of developers. You want to give everyone the freedom to work independently on improvements, bug fixes and features. Thus, it makes sense to branch out from the master branch for these use cases. What are the essential commands for Git branching? You can either create a new branch on your own:

```
git checkout -b <branch>
```

Or checkout a branch that is already there.

```
git checkout <branch>
```

When the branch is newly created by another collaborator and not yet known to your local repository, you can fetch all the branch information from the remote repository. Branches after all are tracked remotely as well. Afterward, you can checkout the branch in your local repository.

```
git fetch
git checkout <branch>
```

Once you are on the branch, you can pull all the recent changes for it from the remote repository.

```
git pull --rebase origin <branch>
```

Now you can start to adjust the code, `git add .` and `git commit` them, and push your changes eventually. But rather than pushing them to the master branch, you would push them to the branch.

```
git push origin <branch>
```

## create new branch

```sh
git checkout -b "newer-branch"
```

```sh
git add .

git commit -m "add a detailed description"
```

```sh
git push --set-upstream origin newer-branch
```

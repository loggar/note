# Rebase

## Update your branch with the latest changes from main while keeping your commits on top.

```sh
# First, save any current changes (if any)
git stash

# Switch to main and get latest changes
git checkout main
git pull

# Switch back to your branch
git checkout your-branch-name

# Rebase your branch on top of main
git rebase main

# If you stashed changes, reapply them (if any)
git stash pop
```

Other way, simple and if you have nothing to stash:

```sh
# First, ensure you're on your feature branch
git checkout your-feature-branch

# Fetch the latest changes from main
git fetch origin main

# Rebase your branch onto the latest main
git rebase origin/main

# Push force
git push --force-with-lease origin your-feature-branch
```

## Interactive Rebase

I must admit, it is not an essential command for Git, but I use it often to organize my commits on a branch. I like to have a tidy branch before I open it as a PR for others. Tidying a branch means to bring commits in an order that makes sense, rewriting commit messages or “squashing” commit. To squash commits means to merge multiple commits into one.

When using an interactive rebase, you can decide how many commits you want to interactively adjust.

```sh
git rebase -i HEAD˜<number>
```

Afterward, since you adjusted the Git history, you need to force push your changes. A force push will overwrite the Git commits in your remote repository.

```sh
git push -f origin master
```

In general, you should be careful with force pushes. A good rule of thumb is that you can do them on a branch, but never on the master branch. In larger projects a force push is often programmatically not allowed on the master branch.

## Resolving Conflicts

Sometimes, when you pull the recent changes from a remote repository or when you rebase the master on a branch, you run into conflicts. Conflicts happen when Git cannot resolve multiple changes on the same file. That can happen more often than expected when collaborating with multiple people.

For instance, imagine it happens for a `git rebase master` on your branch. The command line would indicate that it stopped the rebase and shows you the conflicting files. That’s no reason to panic. You can open the indicated files and resolve the conflicts. In the file you should see the changes well separated: the changes from master (HEAD) and from your branch (usually the commit message). You have to decide which of both versions you want to take in order to resolve the conflict. After you have resolved all conflicts in all files (usually all files are shown on the command line), you can continue the rebase:

```sh
git add .
git rebase --continue
```

If you run again into conflicts, you can resolve them and run the commands again.

## rebase commands:

```sh
# open rebase todo
code .git/rebase-merge/git-rebase-todo
# same as
git rebase --edit-todo

# resume rebase
git rebase --continue

# abort rebase
git rebase --abort
```

## rebase main

```sh
git rebase -i main
```

To integrate changes from the `main` branch so they appear before your current branch's commits, you should use `git rebase`. This rewrites your branch's history to start from the latest commit of `main`.

1.  **Fetch the latest changes from the remote:**
    This ensures your local repository is aware of the latest commits on the `main` branch.

    ```bash
    git fetch origin
    ```

2.  **Rebase your current branch onto `main`:**
    This command reapplies your branch's commits on top of the latest `main` branch history.

    ```bash
    git rebase origin/main
    ```

    If you encounter any merge conflicts, Git will pause the rebase and allow you to resolve them before continuing.

3.  **Force push the rebased branch:**
    Since you have rewritten the commit history, you must force push. Using `--force-with-lease` is a safer option that won't overwrite work if someone else has pushed to the branch.

    ```bash
    git push --force-with-lease
    ```

## squash

The command `git rebase -i main` starts an interactive rebase session.

It takes all the commits from your current branch that are not on the `main` branch and opens an editor. In this editor, you can modify the commit history before it's reapplied on top of the `main` branch.

This allows you to perform actions like:

- **`squash`**: Combine multiple commits into a single one.
- **`reword`**: Change a commit message.
- **`edit`**: Amend a commit's content.
- **`drop`**: Remove a commit entirely.
- **Reorder**: Change the order in which commits are applied.

The primary use is to clean up your feature branch's history to be more linear and logical before merging it into `main`.

```

```

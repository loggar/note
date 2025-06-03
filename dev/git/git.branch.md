# git branch

## Types of branch names

Here's a comprehensive list of branch name prefixes following best practices:

### Core Types

- `feature/` - New functionality or enhancements
- `bugfix/` or `fix/` - Bug corrections
- `hotfix/` - Critical fixes needing immediate deployment to production
- `release/` - Release preparation branches
- `chore/` - Maintenance tasks not affecting production code
- `docs/` - Documentation-only changes

### Additional Types

- `refactor/` - Code changes that neither fix bugs nor add features
- `test/` - Adding or modifying tests
- `style/` - Code style/formatting changes without logic changes
- `perf/` - Performance improvements
- `config/` - Configuration changes
- `build/` - Changes to build system or dependencies
- `ci/` or `infra/` - CI/CD pipeline or infrastructure changes
- `tooling/` - Development tooling changes
- `wip/` - Work in progress
- `experiment/` or `poc/` - Experimental features or proof of concepts
- `backend/` - Backend-specific changes
- `frontend/` - Frontend-specific changes
- `db/` - Database-related changes
- `security/` - Security-related changes
- `i18n/` or `l10n/` - Internationalization/localization changes

### Tips for Usage

- Keep consistent naming across the team
- Follow the prefix with a descriptive but concise name
- Use hyphens instead of spaces (e.g., `feature/add-user-authentication`)
- Include ticket numbers when applicable (e.g., `bugfix/JIRA-123-fix-login-issue`)
- Keep branch names under 50 characters when possible

## rename

### local

```
# If you are in the same branch
git branch -m "new_name"

# If you are in the different branch
git checkout -m "old_name" "new_name"
```

### remote

```
# delete the old branch:
git push origin --delete "old_name"
# - [deleted] old_name

# push the renamed branch
git push -u origin "new_name"
```

Other members who are working on the old branch:

```
# Switch to the "renamed" branch:
git checkout "old_name"

# Rename it:
git branch -m "new_name"

# Fetch latest changes
git fetch

# Remove the existing tracking connection with "origin/old_name":
git branch --unset-upstream

# Create a new tracking connection with the new "origin/new_name" branch:
git branch -u origin/new_name
```

## All merged feature branch in the origin

```
git fetch origin
git branch -r --merged | grep origin/feature | grep -v "\*"
```

## change branch name from master to main

```
git branch -m master main

# if remote exists
git push -u origin main

# Point HEAD to ‘main’ branch
git symbolic-ref refs/remotes/origin/HEAD refs/remotes/origin/main

# Delete ‘master’ branch on the remote repo
git push origin --delete master
```

list branch:

```
git branch -a
```

## Change git init default branch name

```
## Git 2.28+
git config --global init.defaultBranch main

## Git 2.27-
git config --global alias.new '!git init && git symbolic-ref HEAD refs/heads/main'
```

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

## Delete Branch

### deleting local branches

```
git branch -d 'branch-name'
```

### deleting local branches without checking its merge status

```
git branch -D 'branch-name'
```

### deleting remote branches

```
git push origin --delete 'branch-name'
```

or delete local branch and apply it to remote

```
git branch -d <branch>
git push origin :<branch>
```

### delete all merged branch

```sh
#!/bin/bash

# Make sure you are on the main branch
git checkout main
git pull

# Delete all merged branches except for the main branch
git branch --merged | grep -v "\* main" | xargs -n 1 git branch -d

# Push the changes to the remote repository
git push --prune origin
```

```
chmod +x delete_merged_branches.sh
./delete_merged_branches.sh
```

## Compare the branch with other branch

To compare the current branch with `main`, you can use the following Git command in the terminal:

```bash
git diff main...HEAD
```

This will show the differences between the `main` branch and your current branch (`HEAD`). If you want a summary of changes, use:

```bash
git diff --stat main...HEAD
```

For a list of commits unique to your branch compared to `main`, use:

```bash
git log main..HEAD
```

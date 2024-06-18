# [102 GIT] Git Best Practices

## commits

Branch

```
git switch -c feature1
```

Add and commit

```
git add -p
git commit
```

Show

```
git show -p
```

1 PR for one commit

```
git switch feature1
git switch -c feature2
git add -p
git commit
```

Rebase

```
git switch feature1
git rebase main
```

Fix

```
git add -p
git commit --amend --no-edit
```

Revert a part of the commit

```
git restore --source-main --patch
git add -p
git commit --amend --no-edit
```

Commit msg should include information documentation. Not PR desc.

```
git show -p main..
```

Title 50 chars
Body wrap to 72 chars
Ticket number in the last line

## PRs

Squash

```
# in your branch
git rebase -i main
```

```
# fix up "f"
pick a Add feature1
f b Improve feature2
```

Branch

```
git branch --show
```

Push

```
git push
```

Create PR -> PR prefilled if commit message is perfect

## AI

OpenAI Assistant : Commit Genie

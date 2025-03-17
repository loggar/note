# GIT untrack

## Exclude from git

For untracked files: If the file is a new file that's never been committed:

You need to use the local exclude file method instead:

```sh
echo ".github/*.md" >> .git/info/exclude
```

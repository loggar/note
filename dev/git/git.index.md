# git index

## assume unchanged

```sh
git update-index --assume-unchanged dir/someDifferentInCurrentLocal.go
```

Cancel assuming

```sh
git update-index --no-assume-unchanged dir/someDifferentInCurrentLocal.go
```

When you mark a file as "assume unchanged" using `git update-index --assume-unchanged`, Git will ignore changes to that file in your local working directory. However, if the file is changed in the remote repository (origin) and you pull those changes, Git will still update the file in your local repository with the changes from the remote.

In summary:
Your local changes to the file will be ignored by Git.
Changes from the remote repository will still be pulled and applied to the file in your local repository.

### Listing the ignored files and un-ignore all

To list all files that you've marked with `git update-index --assume-unchanged`, you can use the following Git command:

```bash
git ls-files -v | grep "^h"
```

This command works because:

- `git ls-files -v` shows all tracked files with their status
- Files marked with `--assume-unchanged` have a lowercase "h" at the beginning of the line
- The `grep "^h"` filters to only show those files

Or to unmark all at once, you can use:

```bash
git ls-files -v | grep "^h" | cut -c 3- | xargs git update-index --no-assume-unchanged
```

Note that there's no built-in Git command that directly shows only the assume-unchanged files, which is why we need to use this combination of commands.

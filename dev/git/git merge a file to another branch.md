# Merge a file from one branch to another

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

# Resolving Conflicts

Sometimes, when you pull the recent changes from a remote repository or when you rebase the master on a branch, you run into conflicts. Conflicts happen when Git cannot resolve multiple changes on the same file. That can happen more often than expected when collaborating with multiple people.

For instance, imagine it happens for a `git rebase master` on your branch. The command line would indicate that it stopped the rebase and shows you the conflicting files. That’s no reason to panic. You can open the indicated files and resolve the conflicts. In the file you should see the changes well separated: the changes from master (HEAD) and from your branch (usually the commit message). You have to decide which of both versions you want to take in order to resolve the conflict. After you have resolved all conflicts in all files (usually all files are shown on the command line), you can continue the rebase:

```
git add .
git rebase --continue
```

If you run again into conflicts, you can resolve them and run the commands again.

# Git Merge and Git Rebase

## Git Merge

Merging is a common practice for developers using version control systems. Whether branches are created for testing, bug fixes, or other reasons, merging commits changes to another location. To be more specific, merging takes the contents of a source branch and integrates them with a target branch. In this process, only the target branch is changed. The source branch history remains the same.

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

### Pros

- Simple and familiar
- Preserves complete history and chronological order
- Maintains the context of the branch

### Cons

- Commit history can become polluted by lots of merge commits
- Debugging using `git bisect` can become harder

### How to do it

Merge the master branch into the feature branch using the `checkout` and `merge` commands.

```
$ git checkout feature
$ git merge master

# or

$ git merge master feature
```

This will create a new “Merge commit” in the feature branch that holds the history of both branches.

## Git Rebase

Rebase is another way to integrate changes from one branch to another. Rebase compresses all the changes into a single “patch.” Then it integrates the patch onto the target branch.

Unlike merging, rebasing flattens the history because it transfers the completed work from one branch to another. In the process, unwanted history is eliminated.

> Rebases are how changes should pass from the top of the hierarchy downwards, and merges are how they flow back upwards

### Pros

- Streamlines a potentially complex history
- Manipulating a single commit is easy (e.g. reverting them)
- Avoids merge commit “noise” in busy repos with busy branches
- Cleans intermediate commits by making them a single commit, which can be helpful for DevOps teams

### Cons

- Squashing the feature down to a handful of commits can hide the context
- Rebasing public repositories can be dangerous when working as a team
- It’s more work: Using rebase to keep your feature branch updated always
- Rebasing with remote branches requires you to force push. The biggest problem people face is they force push but haven’t set git push default. This results in updates to all branches having the same name, both locally and remotely, and that is dreadful to deal with.

> If you rebase incorrectly and unintentionally rewrite the history, it can lead to serious issues, so make sure you know what you are doing

### How to do it

Rebase the feature branch onto the master branch using the following commands.

```
$ git checkout feature
$ git rebase master
```

This moves the entire feature branch on top of the master branch. It does this by re-writing the project history by creating brand new commits for each commit in the original (feature) branch.

### Interactive Rebasing

This allows altering the commits as they are moved to the new branch. This is more powerful than automated rebase, as it offers complete control over the branch’s commit history. Typically this is used to clean up a messy history before merging a feature branch into master.

```
$ git checkout feature
$ git rebase -i master
```

```
pick 22d6d7c Commit message#1
pick 44e8a9b Commit message#2
pick 79f1d2h Commit message#3
```

This defines exactly what the branch will look like after the rebase is performed. By re-ordering the entities, you can make the history look like whatever you want. For example, you can use commands like `fixup`, `squash`, `edit` etc, in place of `pick`.

## Which one to use

So what’s best? What do the experts recommend?

It’s hard to generalize and decide on one or the other, since every team is different. But we have to start somewhere.

Teams need to consider several questions when setting their Git rebase vs. merge policies. Because as it turns out, one workflow strategy is not better than the other. It is dependent on your team.

Consider the level of rebasing and Git competence across your organization. Determine the degree to which you value the simplicity of rebasing as compared to the traceability and history of merging.

Finally, decisions on merging and rebasing should be considered in the context of a clear branching strategy (Refer this article to understand more about branching strategy). A successful branching strategy is designed around the organization of your teams.

## What do I recommend?

As the team grows, it will become hard to manage or trace development changes with an always merge policy. To have a clean and understandable commit history, using Rebase is reasonable and effective.

By considering the following circumstances and guidelines, you can get best out of Rebase:

- You’re developing locally: If you have not shared your work with anyone else. At this point, you should prefer rebasing over merging to keep your history tidy. If you’ve got your personal fork of the repository and that is not shared with other developers, you’re safe to rebase even after you’ve pushed to your branch.
- Your code is ready for review: You created a pull request. Others are reviewing your work and are potentially fetching it into their fork for local review. At this point, you should not rebase your work. You should create ‘rework’ commits and update your feature branch. This helps with traceability in the pull request and prevents the accidental history breakage.
- The review is done and ready to be integrated into the target branch. Congratulations! You’re about to delete your feature branch. Given that other developers won’t be fetch-merging in these changes from this point on, this is your chance to sanitize your history. At this point, you can rewrite history and fold the original commits and those pesky ‘pr rework’ and ‘merge’ commits into a small set of focused commits. Creating an explicit merge for these commits is optional, but has value. It records when the feature graduated to master.

## Conclusion

I hope this explanation has given some insights on Git merge and Git rebase. Merge vs rebase strategy is always debatable. But perhaps this article will help dispel your doubts and allow you to adopt an approach that works for your team.

## git theirs and ours

### merge

```
git merge -Xtheirs feature

git merge -Xours feature
```

### rebase

Interestingly, it works in reverse order if you want to do rebasing of your branch onto the master and want to keep your changes over the master.

So, if you are on your feature branch, the command you need to run will be:

```
git rebase master -Xtheirs

```

And to keep master branch changes over yours, you need to do:

```
And to keep master branch changes over yours, you need to do:

```

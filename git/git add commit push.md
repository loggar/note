## add commit push

First, you can either add all or only selected changed files for the next commit.

```
git add .
git add <path/to/file>
```

These files will change their status from unstaged to staged files. You can always verify it with `git status`. When files are staged, they can be committed. There is also a way back from a staged to an unstaged file.

```
git reset HEAD <path/to/file>
```

Second, you can commit the staged files with a commit that comes with a commit message. The message describes your change. There are two ways to commit. You can use the shortcut commit command to add the commit message inline:

```
git commit -m "<message>"
```

Also you can use the default commit command to make a more elaborated commit message with multi-lines afterward.

```
git commit
```

git commit with user id

```
git commit --author="Name <email>" -m "whatever"
```

The latter command will open up your default command line editor. Usually, the default command line editor is vim. In vim you would type your commit message. Afterward, you can save and exit vim by using :wq which stands for write and quit. Most of the time, you will use the shortcut commit though. It is fast and often an inlined commit message is sufficient.

Now, before you get to the third step, multiple commits can accumulate in your local repository. Eventually, in the third step, you would push all the commits in one command to the remote repository.

```
git push origin master
```

These are the three necessary steps to get your changes from your local repository to the remote repository. But when you collaborate with others, there can be an intermediate step before you push your changes. It can happen that someone else already pushed changes in the remote repository while you made your changes in your local repository. Thus, you would have to pull all the changes from the remote repository before you are allowed to push your own changes. It can be simple as that:

```
git pull origin master
```

However, I never pull directly. Instead, I pull rebase:

```
git pull --rebase origin master
```

What’s the difference between pull and pull rebase? A basic `git pull` would simply put all the changes from the remote repository on top of your changes. With a pull rebase, it is the other way around. The changes from the remote repository come first, then your changes will be added on top. Essentially a pull rebase has two benefits:

- it keeps an ordered git history, because your changes are always added last
- it helps you to resolve conflicts, if you run into them, because you can adjust your own changes more easily

If you have changed but uncommited files when you pull from the remote repository, you are asked to stash your changed files first. After you have pulled all the changes, you can apply the stash again. Stashing will be explained later in the article.

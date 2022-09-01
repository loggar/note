# git theirs and ours

## merge

```
git merge -Xtheirs feature

git merge -Xours feature
```

## rebase

Interestingly, it works in reverse order if you want to do rebasing of your branch onto the master and want to keep your changes over the master.

So, if you are on your feature branch, the command you need to run will be:

```
git rebase master -Xtheirs

```

And to keep master branch changes over yours, you need to do:

```
And to keep master branch changes over yours, you need to do:

```

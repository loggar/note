# git submodule

```
$ git submodule add https://github.com/user/DbConnector
```

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   .gitmodules
	new file:   DbConnector
```

`.gitmodules`

```
[submodule "DbConnector"]
	path = DbConnector
	url = https://github.com/user/DbConnector
```

## Cloning a Project with Submodules

```
$ git clone https://github.com/user/MainProject
$ cd MainProject
$ cd DbConnector
$ git submodule init
```

git clone with submidules option:

```
$ git clone --recurse-submodules https://github.com/user/MainProject
```

## Pulling in Upstream Changes from the Submodule Remote

```
$ cd MainProject
$ cd DbConnector
$ git fetch
$ git merge origin/master
```

simple way:

```
$ git submodule update --remote DbConnector
```

## Change submodule's branch

```
$ git config -f .gitmodules submodule.DbConnector.branch stable

$ git submodule update --remote
remote: Counting objects: 4, done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 4 (delta 2), reused 4 (delta 2)
Unpacking objects: 100% (4/4), done.
From https://github.com/user/DbConnector
   27cf5d3..c87d55d  stable -> origin/stable
Submodule path 'DbConnector': checked out 'c87d55d4c6d4b05ee34fbc8cb6f7bf4585ae6687'
```

## Pulling Upstream Changes from the Project Remote

```
$ git pull

$ git status

$ git submodule update --init --recursive

$ git status
 On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working tree clean
```

## Publishing Submodule Changes

```
$ git push --recurse-submodules=check
The following submodule paths contain changes that can
not be found on any remote:
  DbConnector

Please try

	git push --recurse-submodules=on-demand

or cd to the path and use

	git push

to push them to a remote.
```

```
$ git push --recurse-submodules=on-demand
Pushing submodule 'DbConnector'
Counting objects: 9, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (8/8), done.
Writing objects: 100% (9/9), 917 bytes | 0 bytes/s, done.
Total 9 (delta 3), reused 0 (delta 0)
To https://github.com/user/DbConnector
   c75e92a..82d2ad3  stable -> stable
Counting objects: 2, done.
Delta compression using up to 8 threads.
Compressing objects: 100% (2/2), done.
Writing objects: 100% (2/2), 266 bytes | 0 bytes/s, done.
Total 2 (delta 1), reused 0 (delta 0)
To https://github.com/user/MainProject
   3d6d338..9a377d1  master -> master
```

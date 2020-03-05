for a new repository

clone a exist repository

```
git clone https://github.com/loggar/gcc.git [directory-name]
```

add remote and push

```
echo "# js" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/loggar/js.git
git remote -v
git push -u origin master
```

remove origin

```
$ git remote -v
# View current remotes
origin  https://github.com/OWNER/REPOSITORY.git (fetch)
origin  https://github.com/OWNER/REPOSITORY.git (push)
destination  https://github.com/FORKER/REPOSITORY.git (fetch)
destination  https://github.com/FORKER/REPOSITORY.git (push)

$ git remote rm destination
# Remove remote

$ git remote -vls -a

# Verify it's gone
origin  https://github.com/OWNER/REPOSITORY.git (fetch)
origin  https://github.com/OWNER/REPOSITORY.git (push)
```

Git init, add remote, and force to pull.

```
git init
git remote add origin https://github.com/loggar/java-9-above.git
git fetch --all
git reset --hard origin/master
```
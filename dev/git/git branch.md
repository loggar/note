# git branch

## rename

### local

```
# If you are in the same branch
git branch -m "new_name"

# If you are in the different branch
git checkout -m "old_name" "new_name"
```

### remote

```
# delete the old branch:
git push origin --delete "old_name"
# - [deleted] old_name

# push the renamed branch
git push -u origin "new_name"
```

Other members who are working on the old branch:

```
# Switch to the "renamed" branch:
git checkout "old_name"

# Rename it:
git branch -m "new_name"

# Fetch latest changes
git fetch

# Remove the existing tracking connection with "origin/old_name":
git branch --unset-upstream

# Create a new tracking connection with the new "origin/new_name" branch:
git branch -u origin/new_name
```

## All merged feature branch in the origin

```
git fetch origin
git branch -r --merged | grep origin/feature | grep -v "\*"
```

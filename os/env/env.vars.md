# Environment variables

only for current shell

```
PY_ENV="production"

echo "$PY_ENV"
```

for all process

```
export PY_ENV="production"

printenv | grep PY_ENV
```

printenv to a file

```
printenv > env.txt
```

## List `PATH` items in each line

```sh
echo $PATH | tr ':' '\n'
```

## Remove a path value

```sh
PATH=$(echo $PATH | tr ':' '\n' | grep -v "/path/to/remove" | paste -sd ':' -)
```

## Add a path value

```sh
[[ ":$PATH:" != *":/your/path/here:"* ]] && PATH="/path/to/add:$PATH"
```

## Print Duplicates in `$PATH`

```sh
#!/bin/sh

# Convert PATH into a newline-separated list, then sort it
echo "$PATH" | tr ':' '\n' | sort | uniq -d

# Explanation:
# 1. `echo "$PATH"` prints the current PATH environment variable.
# 2. `tr ':' '\n'` replaces colons with newlines, splitting the PATH into separate lines.
# 3. `sort` sorts the paths. This is necessary for `uniq` to work correctly, as it only identifies adjacent duplicates.
# 4. `uniq -d` filters out unique lines, leaving only the duplicates.
```

## Remove Duplicates

```sh
export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!arr[$0]++' | sed 's/:$//')
```

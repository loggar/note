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
echo $PATH | tr ':' '\n' | awk '!seen[$0]++' | awk 'seen[$0]++'
```

1. `echo $PATH` prints the current PATH variable.
2. `tr ':' '\n'` translates colons (:) into newlines, converting the PATH list into a vertical list of directories.
3. The first `awk '!seen[$0]++'` processes each line; lines not seen before are passed through. This populates the seen array with the count of each line. Lines seen for the first time are not printed.
4. The second `awk 'seen[$0]++'` then processes the output of the first awk command, printing only those lines (directories) that have been seen before, effectively showing duplicates.

This command is tailored for zsh and uses awk to handle the logic for identifying duplicates, which is a common and powerful tool available in macOS and most Unix-like systems.

## Remove Duplicates

```sh
export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!arr[$0]++' | sed 's/:$//')
```

# PATH

## List `PATH` items in each line

```sh
echo $PATH | tr ':' '\n'
```

## Find a PATH entry

```sh
echo $PATH | grep -q "/a/path"  && echo "Path is included" || echo "Path is not included"
```

## Remove a path value

```sh
export PATH=$(echo $PATH | sed -e 's;:/usr/local/bin;;' -e 's;/usr/local/bin:;;' -e 's;/usr/local/bin;;')
```

```sh
REMOVE_PATH="/usr/local/bin" && \
export PATH=$(echo $PATH | sed -e "s;:$REMOVE_PATH;;" -e "s;$REMOVE_PATH:;;" -e "s;$REMOVE_PATH;;")
```

## Add a path value

```sh
[[ ":$PATH:" != *":/your/path/here:"* ]] && PATH="/path/to/add:$PATH"
```

## Print Duplicates in `$PATH`

```sh
#!/bin/sh

# Convert PATH into a newline-separated list, then sort it, finds duplicates.
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

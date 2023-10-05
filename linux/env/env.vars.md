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

List `PATH` items in each line

```sh
echo $PATH | tr ':' '\n'
```

## Remove Duplicates

```sh
export PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '!arr[$0]++' | sed 's/:$//')
```

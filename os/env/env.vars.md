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

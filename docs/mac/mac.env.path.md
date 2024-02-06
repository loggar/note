# env PATH

## Echo path listed new lines each

```sh
echo $PATH | tr ':' '\n'
```

## Add a new path into $PATH if not exist

```sh
MY_SOME_PATH="/a/b/bin"
[[ ":$PATH:" != *":$MY_SOME_PATH:"* ]] && PATH="$MY_SOME_PATH:$PATH"
echo $PATH
```

# env PATH

## Add a new path into $PATH if not exist

```
MY_SOME_PATH="/a/b/bin"
[[ ":$PATH:" != *":$MY_SOME_PATH:"* ]] && PATH="$MY_SOME_PATH:$PATH"
echo $PATH
```

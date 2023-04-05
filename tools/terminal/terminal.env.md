# env

## remove duplicated items in `PATH`

```
export PATH=$(echo $PATH | awk -v RS=: -v ORS=: '!a[$1]++{if (NR>1) printf(":"); printf("%s", $1)}' | sed 's/:$//')
```

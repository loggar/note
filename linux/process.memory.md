# Memory and Process

## Memory usage by process

```
ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -n
```

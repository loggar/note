# List activated service ports

```
netstat -an | grep LISTEN
```

# Checking who is using a port

```
$ netstat -tulpn | grep 80
tcp6       0      0 :::80                 :::*                   LISTEN     10177/java
```

```
$ ps aux | grep 10177
```

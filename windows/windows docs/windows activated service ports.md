# List activated service ports

```
netstat -an

netstat -ano | findstr :<portnumber>
```

Kill a process that is assigned to a port

```
taskkill /pid <pid> /f
```

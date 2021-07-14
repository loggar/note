# Memory and Process

## List running processes

list running processes

```
ps
```

display all running processes for all users on your machine

```
ps aux
```

top or htop

```sh
top # 'q' for exit session

sudo apt update && sudo apt install htop

htop # 'q' for exit session
```

## Memory usage by process

```
ps aux  | awk '{print $6/1024 " MB\t\t" $11}'  | sort -n
```

Show top 10 processes sorted by memory usage

```
ps aux --sort=-rss | head -n 10
```

## CPU usage

```
ps aux --sort=-pcpu | head -n 10
```

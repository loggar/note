# Linux Disk Usage

Show dir size

```
du -h <dirpath>
```

To list top 50 directories eating disk space in /opt/, enter:

```
du -a /opt/ | sort -n -r | head -n 50
```

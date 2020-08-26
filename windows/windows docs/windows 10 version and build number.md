# Find OS Version and build number

## windows 10

```sh
$ winver
```

Or,

```
Settings - System - About
```

## windows 8 and belows

```sh
$ systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
```

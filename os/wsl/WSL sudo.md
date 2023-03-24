# sudo permission

## Alpine distro

```
LAPTOP-V93U1MOB:~$ apk update
ERROR: Unable to lock database: Permission denied
ERROR: Failed to open apk database: Permission denied
```

### access root

```
# host
wsl -d <distro> -u root
```

or

```
# distro
$ su
```

### install sudo

```
apk add sudo
```

### update wheel group

```
$ visudo
```

```
# uncomment
%wheel ALL=(ALL:ALL) ALL
```

add user to wheel group

```
$ addgroup your-username wheel
$ exit
```

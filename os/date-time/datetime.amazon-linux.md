# Set Date and Time

## manual

```
$ ls /usr/share/zoneinfo

# change zone
$ nano /etc/sysconfig/clock
```

```
ZONE="Australia/Sydney"
```

create a symbolic link to `/etc/timezone`

```
ln -sf /usr/share/zoneinfo/Australia/Canberra /etc/localtime
```

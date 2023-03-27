# Docker

## Change system date in a local container

Tested in Alpine container

```
$ date
Mon Mar 27 05:51:13 UTC 2023

$ apk add tzdata
fetch https://dl-cdn.alpinelinux.org/alpine/v3.16/main/aarch64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.16/community/aarch64/APKINDEX.tar.gz
OK: 151 MiB in 44 packages

# use localtime
$ ln -sf /usr/share/zoneinfo/Australia/Sydney /etc/localtime

$ date
Mon Mar 27 17:21:28 AEDT 2023
```

To change date, run the container with additional privileges:

```
$ docker run -it --rm --privileged app sh
```

```yml
# or docker-compose service
services:
  app:
    ...
    privileged: true
```

Change date:

```
$ date -s "2023-03-28 15:30:00"

$ date
Tue Mar 28 15:30:02 AEDT 2023
```

Revert to host date:

```
$ docker run -it --rm --privileged -v /etc/localtime:/etc/localtime:ro alpine sh
```

```yml
# or docker-compose service
services:
  app:
    ...
    privileged: true
    volumes:
      - /etc/localtime:/etc/localtime:ro
```

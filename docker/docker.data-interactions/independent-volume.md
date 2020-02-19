# How To Share Data between Docker Containers

## Creating an Independent Volume

```
$ docker volume create --name DataVolume1
```

```
$ docker volume ls

DRIVER              VOLUME NAME
local               DataVolume1
```

Run a test container:

```
$ docker run -ti --rm -v DataVolume1:/datavolume1 ubuntu

root@5a626ea33d42:/# ls
bin  boot  datavolume1  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
root@5a626ea33d42:/# cd datavolume1/
root@5a626ea33d42:/datavolume1# echo "Example1" > /datavolume1/Example1.txt
root@5a626ea33d42:/datavolume1# ls
Example1.txt
root@5a626ea33d42:/datavolume1# exit
```

Inspect the volume from the host:

```
$ docker volume inspect DataVolume1

[
    {
        "CreatedAt": "2020-02-19T04:58:43Z",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/var/lib/docker/volumes/DataVolume1/_data",
        "Name": "DataVolume1",
        "Options": {},
        "Scope": "local"
    }
]
```

Run a new container and attach the volume:

```
$ docker run --rm -ti -v DataVolume1:/datavolume1 ubuntu

root@68f16381aefd:/# cd datavolume1/
root@68f16381aefd:/datavolume1# cat /datavolume1/Example1.txt
Example1
root@68f16381aefd:/datavolume1# exit
```

## Creating a Volume that Persists when the Container is Removed

Run a new container with creating a new volume:

```
$ docker run -ti --name=Container2 -v DataVolume2:/datavolume2 ubuntu

root@7f8e2d2459f5:/# echo "Example2" > /datavolume2/Example2.txt
root@7f8e2d2459f5:/# cat /datavolume2/Example2.txt
Example2
root@7f8e2d2459f5:/# exit
```

When we restart the container, the volume will mount automatically:

```
$ docker start -ai Container2

root@7f8e2d2459f5:/# cat /datavolume2/Example2.txt
Example2
```

Docker won’t let us remove a volume if it’s referenced by a container:

```
$ docker volume rm DataVolume2
Error response from daemon: remove DataVolume2: volume is in use - [7f8e2d2459f58c4e958fd3ca8a9d40adda6c4ce7d81c9336bab216bffbbf59ae]
```

## Creating a Volume from an Existing Directory with Data

We already have DataVolume2 volume, and we can mount the volume to other containers.

```
docker run --rm -v DataVolume2:/datavolume2 ubuntu ls /datavolume2
```

## Sharing Data Between Multiple Docker Containers

Mount a volume to a container:

```
$ docker run -ti --name=Container4 -v DataVolume4:/datavolume4 ubuntu

root@ddb5c55a6102:/# echo "This file is shared between containers" > /datavolume4/Example4.txt
root@ddb5c55a6102:/# exit
```

Create new container and Mount Volumes from Container4

```
$ docker run -ti --name=Container5 --volumes-from Container4 ubuntu

root@d907e9e66edb:/# cat /datavolume4/Example4.txt
This file is shared between containers
root@d907e9e66edb:/# echo "Both containers can write to DataVolume4" >> /datavolume4/Example4.txt
root@d907e9e66edb:/# exit
```

View Changes Made in Container5 from Container4:

```
$ docker start -ai Container4

root@ddb5c55a6102:/# cat /datavolume4/Example4.txt
This file is shared between containers
Both containers can write to DataVolume4
```

### Run a new Container and Mount the Volume Read-Only

```
$ docker run -ti --name=Container6 --volumes-from Container4:ro ubuntu

root@fbf756664eab:/# rm /datavolume4/Example4.txt
rm: cannot remove '/datavolume4/Example4.txt': Read-only file system
```
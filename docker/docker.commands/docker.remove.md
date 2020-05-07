# rm

## container

```
$ docker ps -a
```

Remove all stopped containers:

```
$ docker rm $(docker ps -a -q)
```

Remove a container and its volumes:

```
$ docker rm -v redis
```

## volume

```
$ docker volume ls
```

REmove a volume:

```
$ docker volume rm <VOLUME NAME>
```

Remove all unused volumes:

```
$ docker volume prune
```

## images

Remove images with IMAGE ID

```
docker image rm 75835a67d134 2a4cca5ac898
```

Remove all unused images

```
$ docker image ls
$ docker image prune -a
```

## network

```
$ docker network ls
```

Remove a network:

```
$ docker network rm <NETWORK ID>
```

Remove all unused network

```
$ docker network ls
$ docker network prune
```

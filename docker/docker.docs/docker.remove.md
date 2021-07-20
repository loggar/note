# rm

## prune

Rule Them All

```
docker system prune
```

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

Remove Exited Containers:

```
Remove Exited Containers
$ docker rm $(docker ps -q -f "status=exited")
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

Remove Dangling Volumes:

```
$ docker volume rm $(docker volume ls -q -f "dangling=true")
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

Remove Dangling Images:

```
$ docker rmi $(docker images -q -f "dangling=true")
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

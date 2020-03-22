# rm

## container

Remove all stopped containers:

```
$ docker rm $(docker ps -a -q)
```

Remove a container and its volumes:

```
$ docker rm -v redis
```

## volume

Remove all the volumes:

```
$ docker volume prune
```

## images

Remove all unused images

```
$ docker image ls
$ docker image prune -a
```

## network

Remove all unused network

```
$ docker network ls
$ docker network prune
```

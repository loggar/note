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

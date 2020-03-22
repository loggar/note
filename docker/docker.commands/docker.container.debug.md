# Debugging Docker Containers

logs

```
$ docker logs website

$ docker logs -f api
```

top, stats

```
$ docker top database

$ docker stats api
```

inspect

```
$ docker inspect website

$ docker inspect --format '{{.NetworkSettings.IPAddress}}' api
```

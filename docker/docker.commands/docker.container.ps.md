# display docker container list

Running containers

```
docker ps
```

All containers

```
docker ps -a
```

Running containers with disk size

```
docker ps --size
```

List stopped containers

```
docker ps --filter "status=exited"

docker ps -f "status=exited"
```

# docker stop

## Stop and remove all containers

Stop all containers

```
docker container stop $(docker container ls -aq)
```

Remove all stopped containers

```
docker container rm $(docker container ls -aq)
```

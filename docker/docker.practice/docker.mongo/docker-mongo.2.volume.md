# Docker mongoDB container

## MongoDB image

```
docker pull mongo
# or
docker pull mongo:4.4

docker images

```

## Run a container

```
docker run -d --name mongo1 -v c:/Users/webnl/Documents/\_workspace_volume/mongo/mongo1/data:/data/db -p 33401:27017 mongo:4.4
```

`docker-compose.yml`

```yml
services:
  db:
    image: mongo:4.4
      ports:
        - "33401:27017"
    container_name: mongo1
    volumes: c:/Users/webnl/Documents/\_workspace_volume/mongo/mongo1/data:/data/db
```

Pros:

- Great if you need to point several containers to one storage.
- If you delete the container with the `-v` flag it, the volume is still there.
- You know exactly where data is in the host’s filesystem.

Cons:

- Difficult to remove, you have to do it manually.
- Ties containers to that one particular host.
- With many confiners using the same volume, it is quite easy to overwrite data.
- Complicated to manage in large systems with many containers and volumes.

## Docker-managed volumes

```
docker run -d --name mongo1 \
  -v /data/db \
  -p 33401:27017 \
  mongo:4.4
```

`docker-compose.yml`

```yml
services:
  db:
    image: mongo:4.4
      ports:
        - "33401:27017"
    container_name: mongo1
    volumes: /data/db
```

Pros:

- Easy to remove when removing the container, `docker rm <name> -v`.
- Binds to a single container.
- Independent from the host.
- Easier to manage in large systems with many containers and volumes.

Cons:

- Difficult to remove when you forget to use -v when deleting a container.
- Trickier to share one volume with many containers.

## Sharing a Docker-Managed Volume (volume container pattern)

```
$ docker volume create volume_data_mongo

$ docker volume inspect volume_data_mongo
```

`docker-compose.yml`

```yml
services:
db:
  image: mongo:4.4
  ports:
    - "33401:27017"
  container_name: mongo1
  volumes: volume_data_mongo:/data/db
vc_db:
  image: mongo:4.4
  volumes: volume_data_mongo:/data/db
volumes: volume_data_mongo;
```

- To be able to share a volume easily with other containers, just by binding the named volume.
- Whenever you delete the main database image for some reason, even with the `-v` flag, the volume is still there. Volumes can’t be deleted as long as they are connected to at least one container.
- Since we using Docker-managed volumes, we get all the perks mentioned above with this.

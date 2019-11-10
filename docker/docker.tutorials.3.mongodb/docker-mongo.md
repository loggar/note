# Docker and mongo images

- https://docs.docker.com/samples/library/mongo/

## Start a mongo server instance

```
$ docker run --name mongo-cont-1 -d mongo:4.0
```

## Connect to MongoDB from another Docker container

```
$ docker run -it --network network-name-1 --rm mongo mongo --host mongo-cont-1 test
```

## via `docker stack deploy`

Example `stack.yml` for mongo:

```
# Use root/example as user/password credentials
version: '3.1'

services:

  mongo:
    image: mongo
    restart: always
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: example

  mongo-express:
    image: mongo-express
    restart: always
    ports:
      - 8081:8081
    environment:
      ME_CONFIG_MONGODB_ADMINUSERNAME: root
      ME_CONFIG_MONGODB_ADMINPASSWORD: example
```

## Container shell access and viewing MongoDB logs

```
$ docker exec -it mongo-cont-1 bash
# your command..
```

The MongoDB Server log is available through Docker’s container log:

```
$ docker logs mongo-cont-1
```

## Customize configuration without configuration file

See below an example of setting MongoDB to use a `smaller default file size` via `docker run`

```
$ docker run --name mongo-cont-1 -d mongo --smallfiles
```

And here is the same with a `docker-compose.yml` file

```
version: '3.1'
services:
  mongo:
    image: mongo
    command: --smallfiles
```

## Setting WiredTiger cache size limits

Taking the examples above you can configure the cache size to use 1.5GB as:

```
$ docker run --name some-mongo -d mongo --wiredTigerCacheSizeGB 1.5
```

## Using a custom MongoDB configuration file

```
$ docker run --name some-mongo -v /my/custom:/etc/mongo -d mongo --config /etc/mongo/mongod.conf
```

## Environment Variables

```
$ docker run -d --network some-network --name some-mongo \
	-e MONGO_INITDB_ROOT_USERNAME=mongoadmin \
	-e MONGO_INITDB_ROOT_PASSWORD=secret \
	mongo

$ docker run -it --rm --network some-network mongo \
	mongo --host some-mongo \
		-u mongoadmin \
		-p secret \
		--authenticationDatabase admin \
		some-db
> db.getName();
some-db
```

## Docker Secrets

```
$ docker run --name some-mongo -e MONGO_INITDB_ROOT_PASSWORD_FILE=/run/secrets/mongo-root -d mongo
```

## Docker Volume for Storing data

```
$ docker run --name some-mongo -v /my/own/datadir:/data/db -d mongo
```

## Creating database dumps

```
$ docker exec some-mongo sh -c 'exec mongodump -d <database_name> --archive' > /some/path/on/your/host/all-collections.archive
```

## How can I access a MongoDB container from another container?

- https://success.docker.com/article/how-can-i-access-mongodb-container-from-another-container

```
$ docker run -it --entrypoint mongod --hostname MONGODB --name=MONGODB --net=bridge --expose=27017 mongo
```

you are unable to access the MongoDB instance from another application running in another container. You also can't access it using the MongoDB command line client.

What's the issue, and how can I resolve it so I can access the instance, without publishing the mongodb port?

```
$ docker run -it --entrypoint 'mongod --bind_ip_all' --hostname MONGODB --name=MONGODB --net=bridge --expose=27017 mongo
```

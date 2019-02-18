# Run bash or any command in a Docker container

# Docker

Assuming you know the name of your container, or if you don’t run `docker ps` to list the processes running and copy the container name…

Use either docker run or use docker exec with the -i (interactive) flag to keep stdin open and -t to allocate a terminal.

```
docker exec -i -t container_name /bin/bash
```

Or to run one or many commands:

```
docker exec -ti my_container sh -c "echo a && echo b"
```

## Docker Compose

The equivalent commands docker-compose run and docker-compose exec automatically assign a terminal so you can just run the following to get an interactive prompt:

```
docker-compose exec container_name sh
```

The same structure applies to running any command:

```
docker-compose exec <container name> <command>
```
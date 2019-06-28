# Docker’s detached mode for beginners

- https://medium.freecodecamp.org/dockers-detached-mode-for-beginners-c53095193ee9

```
docker run --detach IMAGE
```

Detached mode, shown by the option `--detach` or `-d`, means that a Docker container runs in the background of your terminal. It does not receive input or display output. If you run containers in the background, you find out their details and then reattach your terminal to its input and output.

This tutorial is aimed at beginners. I will show you how to run containers in detached mode. Then reconnect them to your terminal input and output if needed.

## Detached mode

When starting a Docker container, you must first decide if you want to run the container in the background in a detached mode or in the default foreground mode. You may want to use this if you want a container to run but do not want to view and follow all its output.

```
docker run -d IMAGE
```

If you run containers in detached mode, you may then need to check on their status or run commands on them. Next, I will explain how to view them in your terminal.

## View containers

Once you have started your containers in detached mode, you can view them running using the CLI command `docker ps`.

By default, it lists running containers. Some useful options include:

- `-a` / `-all` for all containers (default shows just running)
- `--quiet` /`-q` to list their ids (useful for when you want to get all the containers).

To see even more information about a container you can view its logs.

## View container logs

Once you have certain details about containers, such as their* name or ID *, you can then view their output using the command `docker logs`.

```
docker logs [OPTIONS] CONTAINER
```

- `--tail` While the default is all lines, you can specify a specific number of lines to show from the end of the logs.
- `--follow` , `-f` Follow log output, which means it will print the running container's logs to standard out as it is being used.

## Execute commands in running containers

```
docker exec -i -t container_name /bin/bash
```

## Attach

The `docker attach` command connects your terminal’s standard input, output and error to a running container by passing it the container name or ID.

```
docker attach [OPTIONS] CONTAINER
```

This allows you to view its ongoing output or to control it interactively, as though the commands were running directly in your terminal.

```
$ docker run -d --name topdemo ubuntu /usr/bin/top -b

$ docker attach topdemo
```

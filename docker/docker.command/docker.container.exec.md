# docker commands

## `exec`

This is for when you want to run a command in an existing container. This is better if you already have a container running and want to change it or obtain something from it. For example, if you are using docker-compose you will probably spin-up multiple containers and you may want to access one or more of them once they are created.

```
docker exec [OPTIONS] CONTAINER COMMAND [ARG...]
```

Docker `exec` also has a range of options and arguments you can specify, although you must state the container and command to execute. You can start an interactive bash shell on a container named `ubuntu_bash` using:

```
docker exec -it ubuntu_bash bash
```

Here the options `-it` have the same effect as with run. An example with more options and arguments is:

```
docker exec -d -w /temp ubuntu_bash touch my_file.sh
```

- `-w` followed by the directory or file path allows you to state which working directory you want to run the command in.
- `-d` or `-detached` means that the container will run in detached mode, so you can still continue to use your terminal session with the container running in the background. Don’t use this if you want to see what the container sends to STDOUT.
- The command is `touch` used to create the file with the name `my_file.sh` inside the `/temp` directory of the running container `ubuntu_bash`

## Run bash or any command in a Docker container

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

# Docker command

## Basic Docker Commands

```
$ sudo docker info
$ sudo docker version (docker --version)
$ sudo docker search centos
$ docker pull centos
$ sudo docker images
$ sudo docker rmi centos
```

## Run a docker container

```
$ docker run centos cat /etc/issue
$ sudo docker ps -l
$ sudo docker start <container-id>
$ sudo docker start <container-name>
$ docker run --name <image-name> centos cat /etc/issue
$ docker run -it centos bash

# uname -a
# cat /etc/redhat-release
# exit
$ docker ps -l
```

## docker commands

- `docker build` — builds an image from a Dockerfile
- `docker images` — displays all Docker images on that machine
- `docker run` — starts container and runs any commands in that container
- there’s multiple options that go along with docker run including
  - `-p` — allows you to specify ports in host and Docker container
  - `-it` — opens up an interactive terminal after the container starts running
  - `-v` — bind mount a volume to the container
  - `-e` — set environmental variables
  - `-d` — starts the container in daemon mode (it runs in a background process)
- `docker rmi` — removes one or more images
- `docker rm` — removes one or more containers
- `docker kill` — kills one or more running containers
- `docker ps` — displays a list of running containers
- `docker tag` — tags the image with an alias that can be referenced later (good for versioning)
- `docker login` — login to Docker registry

## examples

```
docker build -t user1/node-example .
```

This says to Docker: build (`build`) the image from the Dockerfile at the root level (`.`) and tag it `-t` as `user1/node-example`. Don’t forget the period — this is how Docker knows where to look for the Dockerfile.

```
docker run -p 3003:8080 -d user1/node-example
```

This tells Docker to run (`run`) the image that was built and tagged as `user1/node-example`, expose port 3003 on the host machine and look for port 8080 inside the Docker container (`-p 3003:8080`), and start the process as a background daemon process (`-d`).

## Docker kill vs Docker stop

- docker stop, this sends the signal `SIGTERM` followed by `SIGKILL` after a grace period. In short, this is a way to bring down the container in a more graceful way meaning it gets to release resources and saving state.
- docker kill, this sends `SIGKILL` right away. This means resource release or state save might not work as intended. In development, it doesn’t really matter which one of the two commands are being used but in a production scenario it probably wiser to rely on `docker stop`

### top Docker Containers by Name Using Patterns

```
docker container stop $(docker container ls -q --filter name=myapp*)
```

## List Docker processes and data

`docker container ls -a` list containers, also can be shown with `docker ps`

`docker image ls -a` list images, there is also the command `docker images`

`docker volume ls` list volumes

`docker network ls` lists networks

`docker info` lists the number of containers and image, as well as system wide information regarding the Docker installation

## Show Total Disk Space Used by Docker

```
docker system df
```

## docker ps

Filter:

```
docker ps --filter "label=com.docker.compose.project=service-kafka"
```

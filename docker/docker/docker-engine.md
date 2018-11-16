# docker engine

> “The Docker Engine is Docker’s powerful open source containerization technology combined with a work flow for building and containerizing your applications.” — Docker, About Docker Engine

## docker engine commands

* docker build — builds an image from a Dockerfile
* docker images — displays all Docker images on that machine
* docker run — starts container and runs any commands in that container
* there’s multiple options that go along with docker run including
* -p — allows you to specify ports in host and Docker container
* -it—opens up an interactive terminal after the container starts running
* -v — bind mount a volume to the container
* -e — set environmental variables
* -d — starts the container in daemon mode (it runs in a background process)
* docker rmi — removes one or more images
* docker rm — removes one or more containers
* docker kill — kills one or more running containers
* docker ps — displays a list of running containers
* docker tag — tags the image with an alias that can be referenced later (good for versioning)
* docker login — login to Docker registry

## examples

```
docker build -t user1/node-example .
```

This says to Docker: build (`build`) the image from the Dockerfile at the root level (` . `) and tag it `-t` as `user1/node-example`. Don’t forget the period — this is how Docker knows where to look for the Dockerfile.

```
docker run -p 3003:8080 -d user1/node-example
```

This tells Docker to run (`run`) the image that was built and tagged as `user1/node-example`, expose port 3003 on the host machine and look for port 8080 inside the Docker container (`-p 3003:8080`), and start the process as a background daemon process (`-d`).

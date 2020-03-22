# Get started with Docker

## Test your installation

```
$ docker --version
```

Pull an image

```
$ docker run hello-world

Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:9572f7cdcee8591948c2963463447a53466950b3fc15a247fcad1917ca215a2f
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.
...
```

## Explore docker

Pull an image of the Ubuntu OS and run an interactive terminal inside the spawned container:

```
 > docker run --interactive --tty ubuntu bash

 docker : Unable to find image 'ubuntu:latest' locally
 latest: Pulling from library/ubuntu
 22e816666fd6: Pull complete
 079b6d2a1e53: Pull complete
 11048ebae908: Pull complete
 c58094023a2e: Pull complete
 Digest: sha256:a7b8b7b33e44b123d7f997bd4d3d0a59fafc63e203d17efedf09ff3f6f516152
 Status: Downloaded newer image for ubuntu:latest
```

You are in the container. At the root # prompt, check the hostname of the container:

```
root@8ad2439b90ed:/# hostname
8ad2439b90ed
```

Exit container

```
root@8ad2439b90ed:/# exit
```

List all containers

```
$ docker container ls --all
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS                      PORTS               NAMES
8ad2439b90ed        ubuntu              "bash"              About a minute ago   Exited (0) 11 seconds ago                       relaxed_archimedes
655d4555f9a3        hello-world         "/hello"            4 minutes ago        Exited (0) 4 minutes ago                        interesting_shannon
4a3b6807a200        ubuntu              "bash"              7 minutes ago        Exited (0) 6 minutes ago                        objective_cerf
```

## Explore dockerized nginx web server

```
$ docker run --detach --publish 80:80 --name webserver nginx

Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
bc51dd8edc1b: Pull complete
66ba67045f57: Pull complete
bf317aa10aa5: Pull complete
Digest: sha256:ad5552c786f128e389a0263104ae39f3d3c7895579d45ae716f528185b36bc6f
Status: Downloaded newer image for nginx:latest
8c999388a8ee4a103917229c8c1df3b2db486da3b7eaa59134d82dc5ee31f7c9
```

```
$ docker container ls --all
CONTAINER ID        IMAGE               COMMAND                  CREATED              STATUS                     PORTS                NAMES
8c999388a8ee        nginx               "nginx -g 'daemon of…"   About a minute ago   Up About a minute          0.0.0.0:80->80/tcp   webserver
8ad2439b90ed        ubuntu              "bash"                   3 minutes ago        Exited (0) 2 minutes ago                        relaxed_archimedes
655d4555f9a3        hello-world         "/hello"                 7 minutes ago        Exited (0) 7 minutes ago                        interesting_shannon
4a3b6807a200        ubuntu              "bash"                   10 minutes ago       Exited (0) 9 minutes ago                        objective_cerf
```

Visit `http://localhost:80/`.

Stop the running nginx container with name `webserver`:

```
docker container stop webserver
```

```
$ docker container ls --all
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                      PORTS               NAMES
8c999388a8ee        nginx               "nginx -g 'daemon of…"   3 minutes ago       Exited (0) 2 seconds ago                        webserver
8ad2439b90ed        ubuntu              "bash"                   6 minutes ago       Exited (0) 5 minutes ago                        relaxed_archimedes
655d4555f9a3        hello-world         "/hello"                 9 minutes ago       Exited (0) 9 minutes ago                        interesting_shannon
4a3b6807a200        ubuntu              "bash"                   12 minutes ago      Exited (0) 12 minutes ago                       objective_cerf
```

# docker commands

## run

```
docker run [OPTIONS] IMAGE [COMMAND] [ARG...]
```

## options

```
The top 10 docker run options in alphabetical order.

1) `--detach`, `-d` By default a Docker container is run attached to local standard input, output, and error streams. The `-d`, `--detach` option runs the container in the background of your terminal session so its output is not displayed. This option is covered in more detail in Docker’s detached mode for beginners: How to run containers in the background of your terminal

2) `--entrypoint` Set or overwrite the default entrypoint command for the image. The entrypoint sets the command and parameters that will be executed first when a container is run. Any any commands and arguments passed at the end of the docker run command will be appended to the entrypoint. To learn more about using Entrypoint, check out Docker ENTRYPOINT & CMD: Dockerfile best practices

3) `--env`, `-e` Set an environment variable using a KEY=VALUE pair. If you have environment variables in a file, you can pass in the file path to the option `--env-file`.

4) `--ip` Declare an IP address, for example `--ip=10.10.9.75`

5) `--name` Assign a name to the container, -`-name my_container`

6) -`-publish`, `-p` or `--publish-all`, `-P` These publish port mappings between the container and host that are defined in an image’s Dockerfile or by using the expose option, `--expose`. The option `--publish`, `-p` publishes a container’s port(s) to the host, while -`-publish-all` , `-P` publishes all exposed ports. You can learn more about exposing and defining ports in Expose vs publish: Docker port commands explained simply

7) `--rm` Automatically remove the container when it exits. The alternative would be to manually stop it and then remove it, for more on how to do this see: How to delete Docker containers from the command line

8) `--tty`, `-t` Allocate a virtual terminal session within the container. This is commonly used with the option `--interactive`, `-i`, which keeps STDIN open even if running in detached mode. One of the most common uses of `-i` `-t` is to run a command, such as bash, in a container, which you can read more about in my post Run bash or any command in a Docker container

9) `--volume`, `-v` Mount a volume `-v /my_volume`. If you are new to volumes then find out more in Docker’s guide to Volumes.

10) `--workdir` , `-w` State the working directory inside the container. For example, if you copy your files into an app folder within your container then you may want to set the working directory to app.
```

## Run stopped containers

```
docker start $(docker ps -a -q --filter "status=exited")
```

```
docker start  `docker ps -q -l` # restart it in the background
docker attach `docker ps -q -l` # reattach the terminal & stdin
```

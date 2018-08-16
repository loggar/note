## Clean out your Docker images, containers and volumes

* https://medium.com/the-code-review/clean-out-your-docker-images-containers-and-volumes-with-single-commands-b8e38253c271


### Just clean out unused data and processes

```
docker system prune

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
```

```
docker system prune --all --force --volumes

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all volumes not used by at least one container
        - all images without at least one container associated to them
        - all build cache
```

prune can also be used on just one aspect:

```
docker container prune    # Remove all stopped containers
docker volume prune       # Remove all unused volumes
docker image prune        # Remove unused images
```

### Destroy all for a complete Docker refresh

```
docker container stop [CONTAINERS...]
```

you need to get a list of all container IDs.

```
docker container ls -aq
```

`ls` lists the containers

`--all` / `-a` all containers (default shows just running)

`--quiet` / `-q` only display numeric IDs

So to pass the return value of this command, the IDs of all containers, to `docker stop`, you need to wrap it in `$()`.

The full command for stopping all docker containers is now:

```
docker container stop $(docker container ls -a -q)
```

A complete Docker system clean can now be achieved by linking this with the full prune command covered earlier in this post.

```
docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes
```

Similarly, you now know how to combine docker commands to just remove one aspect if you prefer. Pass a list of all the IDs to the associated remove command.


* Containers `docker container rm $(docker container ls -a -q)`
* Images `docker image rm $(docker image ls -a -q)`
* Volumes `docker volume rm $(docker volume ls -q)`
* Networks `docker network rm $(docker network ls -q)`

> NOTE: There are alternative methods for doing this, for example `docker ps` for listing running containers, and `docker rm` for removing containers. I have written it this way as I feel it is more memorable to use consistent command names and syntax across docker objects.

### How to reuse them easily with shell aliases

Instead of typing these out each time you can set them as aliases for your shell. You can call the commands whatever you like, here I have called them docker-clean.

```
alias docker-clean-unused='docker system prune --all --force --volumes'

alias docker-clean-all='docker stop $(docker container ls -a -q) && docker system prune -a -f --volumes'
```

To set them to load up when you run your shell, add them to your shell’s rc file.

```
echo [ALIASES...] \
>> ~/.bashrc
```

Then reload the file with the new aliases.

```
source ~/.bashrc
```

The full command for bash:

```
echo "alias docker-clean-unused='docker system prune --all --force --volumes'
alias docker-clean-all='docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes'" \

>> ~/.bashrc && source ~/.bashrc
```

The full command for Zsh:

```
echo "alias docker-clean-unused='docker system prune --all --force --volumes'
alias docker-clean-all='docker container stop $(docker container ls -a -q) && docker system prune -a -f --volumes'" \

>> ~/.zshrc && source ~/.zshrc
```

### Now try the alias commands out in your terminal!

```
MacBook-Pro% docker ps
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS              PORTS                                                                                        NAMES
7087fe30f52d        rabbitmq:3.7.3-management   "docker-entrypoint..."   4 minutes ago       Up 4 minutes        4369/tcp, 5671/tcp, 0.0.0.0:5672->5672/tcp, 15671/tcp, 25672/tcp, 0.0.0.0:15672->15672/tcp   docker_rabbit_1

MacBook-Pro% docker-clean-all
7087fe30f52d
Deleted Containers:
7087fe30f52dbf84568f3429c52c8b24e335ff5f024a4d3f394f2eef7f0976c6

Deleted Networks:
docker_default

Deleted Volumes:
8c295273aca8a97bfe993fddbb9c0d4f66f7e81c8d8c625adbd0893d4b4a2847

Deleted Images:
untagged: rabbitmq:3.7.3-management
untagged: rabbitmq@sha256:0f681f18d80b2979596e8b262d06cacf7948e924d7f3a67e89be5fdea82cd116
deleted: sha256:2f415b0e9a6e74486edbc01ed99713225f6e65d31256819120319137c280c840
deleted: sha256:bcbbeee6343a0f57576e7c3f67dfa992c11d0e24d916e998dec5eb17c3e180f6

...
Total reclaimed space: 155.1MB
```

### Learn more

Having these commands make it quick and easy to manage your docker system. Now you know how to list and remove things in docker, why not create other aliases, for example just for cleaning out containers:

```
alias docker-clean-containers='docker container stop $(docker container ls -a -q) && docker container rm $(docker container ls -a -q)'
```
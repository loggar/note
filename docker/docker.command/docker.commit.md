# docker commit

```
$ docker ps -a
CONTAINER ID        IMAGE                       COMMAND                  CREATED             STATUS                      PORTS                                      NAMES
e7a97f4410c0        mariadb:10.2                "docker-entrypoint.s…"   8 months ago        Up 12 minutes               0.0.0.0:33301->3306/tcp                    mariadb1
c80be90b17aa        mysql:8.0.17                "docker-entrypoint.s…"   8 months ago        Up 12 minutes               33060/tcp, 0.0.0.0:33302->3306/tcp         mysql1
b091fc499bbc        centos-7:project1-replica   "/bin/bash"              9 months ago        Exited (255) 2 months ago   0.0.0.0:80->80/tcp, 0.0.0.0:443->443/tcp   centos1
```

Commit your container to a new image

```
$ docker commit [CONTAINER_ID] [NEW_IMAGE_NAME]
```

The commit operation will not include any data contained in volumes mounted inside the container.

```
docker commit <container-id> app-maria:0.0.1
```

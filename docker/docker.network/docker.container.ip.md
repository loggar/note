# docker container ip

from host:

```
$ docker exec container_name cat /etc/hosts
```

using docker inspect:

```
$ docker ps -la
$ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' 3c6bb70ea59b
```

using docker network:

```
$ docker netowrk ls
$ docker network inspect -f '{{range .IPAM.Config}}{{.Subnet}}{{end}}' bridge
```


from container:

```
$ docker exec -it container_name /bin/bash

# running inside the container_name container
# ip -4 -o address
```

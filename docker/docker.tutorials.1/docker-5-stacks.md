# Docker Tutorial

## Stacks

### Check docker machine

* List docker machine
```
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
default   -        virtualbox   Running   tcp://192.168.99.100:2376           v17.10.0-ce
myvm1     *        virtualbox   Running   tcp://192.168.99.101:2376           v17.11.0-ce
myvm2     -        virtualbox   Running   tcp://192.168.99.102:2376           v17.11.0-ce
```
>If the machines are stopped, run docker-machine start myvm1 to boot the manager, followed by docker-machine start myvm2 to boot the worker.

* Check docker node READY
```
$ docker-machine ssh myvm1 "docker node ls"
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
whbtookswttbg5iig67y34fqr *   myvm1               Ready               Active              Leader
9fyckbn7vonxnq7x7l5snfbh2     myvm2               Ready               Active
```

### The Stack : the top of the hierarchy of distributed applications.

* Add a new Service "Visualizer" (docker-compose.yml)
```
version: "3"
services:
  web:
    image: loggar/get-started:part2
    deploy:
      replicas: 4
      resources:
        limits:
          cpus: "0.1"
          memory: 50M
      restart_policy:
        condition: on-failure
    ports:
      - "80:80"
    networks:
      - webnet
  visualizer:
    image: dockersamples/visualizer:stable
    ports:
      - "8080:8080"
    volumes:
      - "/var/run/docker.sock:/var/run/docker.sock"
    deploy:
      placement:
        constraints: [node.role == manager]
    networks:
      - webnet
networks:
  webnet
```

* redeploy
```
$ eval $(docker-machine env myvm1)

$ docker stack deploy -c docker-compose.yml getstartedlab
Creating service getstartedlab_visualizer
Updating service getstartedlab_web (id: v2d17yp66rxmy8mp0975ht57j)
```

* Take a look at the visualizer [http://192.168.99.101:8080]

* List all service
```
$ docker stack ps getstartedlab
$ docker stack ps getstartedlab
ID                  NAME                         IMAGE                             NODE                DESIRED STATE       CURRENT STATE            ERROR               PORTS
ppa16tzx8xqs        getstartedlab_visualizer.1   dockersamples/visualizer:stable   myvm1               Running             Running 5 minutes ago
qd3wak73294k        getstartedlab_web.2          loggar/get-started:part2          myvm2               Running             Running 31 minutes ago
11tl3yij7w48        getstartedlab_web.3          loggar/get-started:part2          myvm1               Running             Running 31 minutes ago
hy6b1bjbnu86        getstartedlab_web.4          loggar/get-started:part2          myvm2               Running             Running 31 minutes ago
rd6j5x72hyky        getstartedlab_web.5          loggar/get-started:part2          myvm1               Running             Running 31 minutes ago
```

### Persist the data

* Add a new Service "Redis" (docker-compose.yml)
```
redis:
    image: redis
    ports:
      - "6379:6379"
    volumes:
      - /home/docker/redis_data:/redis_data
    deploy:
      placement:
        constraints: [node.role == manager]
    command: redis-server --appendonly yes
    networks:
      - webnet
```
```
$ docker-machine ssh myvm1 "mkdir ./redis_data"
```

* redeploy
```
$ eval $(docker-machine env myvm1)

$ docker stack deploy -c docker-compose.yml getstartedlab
Creating service getstartedlab_redis
Updating service getstartedlab_web (id: v2d17yp66rxmy8mp0975ht57j)
Updating service getstartedlab_visualizer (id: vbrpmu6qh8dseqqk3uw33j38m)
```

* List services
```
$ docker service ls
ID                  NAME                       MODE                REPLICAS            IMAGE                             PORTS
tpgcwaz3h2qc        getstartedlab_redis        replicated          1/1                 redis:latest                      *:6379->6379/tcp
v2d17yp66rxm        getstartedlab_web          replicated          4/4                 loggar/get-started:part2          *:80->80/tcp
vbrpmu6qh8ds        getstartedlab_visualizer   replicated          1/1                 dockersamples/visualizer:stable   *:8080->8080/tcp
```

* Check the http service
```
$ curl -4 http://192.168.99.101
<h3>Hello World!</h3><b>Hostname:</b> 6fe9d8d24f49<br/><b>Visits:</b> 1
```

* Check the visualizer. [http://192.168.99.101:8080]

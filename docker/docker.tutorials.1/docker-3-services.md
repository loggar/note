# Docker Tutorial

## Services

### Run load-balanced app

* Save docker-service YAML file
```
version: "3"
services:
  web:
    image: loggar/get-started:part2
    deploy:
      replicas: 5
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
networks:
  webnet:
```
* List services
```
$ docker service ls
Error response from daemon: This node is not a swarm manager. Use "docker swarm init" or "docker swarm join" to connect this node to swarm and try again.
```

* Initialize Swarm manager
```
$ docker swarm init
Error response from daemon: could not choose an IP address to advertise since this system has multiple addresses on different interfaces (10.0.2.15 on eth0 and 192.168.99.100 on eth1) - specify one with --advertise-addr
```

* Initialize Swarm manager with specified network interface / IP-address / node
```
$ docker swarm init --advertise-addr $(docker-machine ip default)
Swarm initialized: current node (gvi35xty3d60dbechplyp1aw2) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-59aqoh3zet30caqytcs2qk252qtpd5wit1gkifp66qmsjidm4f-ekig9m5xd58cekyvp1yztrb0j 192.168.99.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

* Deploy the service with a deploy name
```
$ docker stack deploy -c docker-compose.yml getstartedlab
Creating network getstartedlab_webnet
Creating service getstartedlab_web
```

* List services
```
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE                      PORTS
rif7a8uxqgau        getstartedlab_web   replicated          5/5                 loggar/get-started:part2   *:80->80/tcp
```

* List all task of a service
```
$ docker service ps getstartedlab_web
ID                  NAME                  IMAGE                      NODE                DESIRED STATE       CURRENT STATE           ERROR               PORTS
z5io4e8v46kh        getstartedlab_web.1   loggar/get-started:part2   default             Running             Running 5 minutes ago
wqn99hngvjqw        getstartedlab_web.2   loggar/get-started:part2   default             Running             Running 5 minutes ago
tg55p7mml8w6        getstartedlab_web.3   loggar/get-started:part2   default             Running             Running 5 minutes ago
o8uvo5rb82bt        getstartedlab_web.4   loggar/get-started:part2   default             Running             Running 5 minutes ago
cmvaolh04nd3        getstartedlab_web.5   loggar/get-started:part2   default             Running             Running 5 minutes ago
```

* List all container
```
$ docker container ls
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS               NAMES
3a2d6172191e        loggar/get-started:part2   "python app.py"     8 minutes ago       Up 8 minutes        80/tcp              getstartedlab_web.5.cmvaolh04nd3ihn8w5sib93z7
bb1c6274b232        loggar/get-started:part2   "python app.py"     8 minutes ago       Up 8 minutes        80/tcp              getstartedlab_web.4.o8uvo5rb82bt0jikmahg0t9pp
b589df44867d        loggar/get-started:part2   "python app.py"     8 minutes ago       Up 8 minutes        80/tcp              getstartedlab_web.1.z5io4e8v46khja0wzg954ighs
3cd6451a919d        loggar/get-started:part2   "python app.py"     8 minutes ago       Up 8 minutes        80/tcp              getstartedlab_web.3.tg55p7mml8w681rfp2yupz79c
907d997b39be        loggar/get-started:part2   "python app.py"     8 minutes ago       Up 8 minutes        80/tcp              getstartedlab_web.2.wqn99hngvjqw2g5ytmhaj6u4v
```

### Test service load-balancing

* console
```
$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> 3a2d6172191e<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> 3cd6451a919d<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> bb1c6274b232<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> b589df44867d<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> 907d997b39be<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.100
<h3>Hello World!</h3><b>Hostname:</b> 3a2d6172191e<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>
```

### Scale the app

* Change replicas value in yml file and save the file.

* Deploy the service with a deploy name
```
$ docker stack deploy -c docker-compose.yml getstartedlab
Updating service getstartedlab_web (id: rif7a8uxqgaurhm72pd0gz8xg)
```

* List services
```
$ docker service ls
ID                  NAME                MODE                REPLICAS            IMAGE                      PORTS
rif7a8uxqgau        getstartedlab_web   replicated          6/6                 loggar/get-started:part2   *:80->80/tcp
```

### Take down the app and the swarm

* Take the app down
```
$ docker stack rm getstartedlab
Removing service getstartedlab_web
Removing network getstartedlab_webnet
```

* Take down the swarm
```
$ docker swarm leave --force
Node left the swarm.
```

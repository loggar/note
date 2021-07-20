# Docker - Configure networking

## Work with network commands

### Create networks

```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
8135a16f9477        bridge              bridge              local
fef9b7bade1a        docker_gwbridge     bridge              local
93f1d10ad92f        host                host                local
2c5faeaea6fc        isolated_nw         bridge              local
3d57e8ebb6db        none                null                local
```

- Create default networks (bridge)

```
$ docker network create simple-network
698dc28706da53cd1558572550a8f0578095fc52bae1b52bde9322fcc820c87c
```

```
$ docker network inspect simple-network
[
    {
        "Name": "simple-network",
        "Id": "698dc28706da53cd1558572550a8f0578095fc52bae1b52bde9322fcc820c87c",
        "Created": "2017-11-28T06:06:41.586981956Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.19.0.0/16",
                    "Gateway": "172.19.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]
```

- Create overlay networks with options

```
$ docker swarm init --advertise-addr $(docker-machine ip default)
Swarm initialized: current node (j17ya4oo3xbgkuxz2gyjm8jg7) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-1ainrj3105lndgaba86vs613dcgxgsht01us3e6lo31aniasyy-eyth11iafxg0yx2jru192eps2 192.168.99.100:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```

```
$ docker network create -d overlay --subnet=192.168.0.0/16 --gateway=192.168.0.100 --ip-range=192.168.1.0/24 --aux-address="my-router=192.168.1.5" my-multih ost-network
im0ogc3j3ebj9ujqngqnyj6eh

$ docker network ls
NETWORK ID          NAME                   DRIVER              SCOPE
8135a16f9477        bridge                 bridge              local
fef9b7bade1a        docker_gwbridge        bridge              local
93f1d10ad92f        host                   host                local
kdosb4zvghju        ingress                overlay             swarm
2c5faeaea6fc        isolated_nw            bridge              local
im0ogc3j3ebj        my-multihost-network   overlay             swarm
3d57e8ebb6db        none                   null                local
698dc28706da        simple-network         bridge              local
```

> The following example uses -o to bind to a specific IP address available on the host when binding ports, then uses docker network inspect to inspect the network, and finally attaches a new container to the new network. Note that you should replace the IP address 172.23.0.1 shown in the example with an IP address available on a network interface in your host.

```
$ docker network create -o "com.docker.network.bridge.host_binding_ipv4"="172.23.0.1" my-network
658cbe4e01fd4549f9bbe163c45c479a6dbff7289485e25ba7ddfdff549f61db

$ docker network inspect my-network
[
    {
        "Name": "my-network",
        "Id": "658cbe4e01fd4549f9bbe163c45c479a6dbff7289485e25ba7ddfdff549f61db",
        "Created": "2017-11-28T06:20:36.133999724Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.20.0.0/16",
                    "Gateway": "172.20.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {
            "com.docker.network.bridge.host_binding_ipv4": "172.23.0.1"
        },
        "Labels": {}
    }
]

$ docker run -d -P --name redis --network my-network redis

$ docker ps
```

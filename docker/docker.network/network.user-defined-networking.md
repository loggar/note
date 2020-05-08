# Docker container networking

## User-defined networks

- Bridge networks

```
$ docker network create --driver bridge isolated_nw
2c5faeaea6fc761c6c1a736ad1effc3a0b11804a20eca5c7f1c79cdbdf931c88
```

```
$ docker network inspect isolated_nw
[
    {
        "Name": "isolated_nw",
        "Id": "2c5faeaea6fc761c6c1a736ad1effc3a0b11804a20eca5c7f1c79cdbdf931c88",
        "Created": "2017-11-27T06:24:28.788396078Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
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

```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
83ae59c7ae1e        bridge              bridge              local
93f1d10ad92f        host                host                local
2c5faeaea6fc        isolated_nw         bridge              local
3d57e8ebb6db        none                null                local
```

```
$ docker run --network=isolated_nw -itd --name=container3 busybox
d5d509a2cd354db04453ffb66b1b08f583fa678490b08f8d6f1736ab128600c3
```

```
$ docker network inspect isolated_nw
[
    {
        "Name": "isolated_nw",
        "Id": "2c5faeaea6fc761c6c1a736ad1effc3a0b11804a20eca5c7f1c79cdbdf931c88",
        "Created": "2017-11-27T06:24:28.788396078Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
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
        "Containers": {
            "d5d509a2cd354db04453ffb66b1b08f583fa678490b08f8d6f1736ab128600c3": {
                "Name": "container3",
                "EndpointID": "5cd49ae466aff6d2161eed1c088c0beaef31b8dd1a7de90bb4f7d2597e95d9ac",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }
        },
        "Options": {},
        "Labels": {}
    }
]
```

- The `docker_gwbridge` network

```
$ docker network create --subnet 172.30.0.0/16 \
> --opt com.docker.network.bridge.name=docker_gwbridge \
> --opt com.docker.network.bridge.enable_icc=false \
> docker_gwbridge
fef9b7bade1a513bc2ca41fe4d14b2083ed8009524acbf21502727eb1dd96e98

$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
83ae59c7ae1e        bridge              bridge              local
fef9b7bade1a        docker_gwbridge     bridge              local
93f1d10ad92f        host                host                local
2c5faeaea6fc        isolated_nw         bridge              local
3d57e8ebb6db        none                null                local
```

- Overlay networks in swarm mode

```
$ docker network create \
  --driver overlay \
  --subnet 10.0.9.0/24 \
  my-multi-host-network
400g6bwzd68jizzdx5pgyoe95

$ docker service create --replicas 2 --network my-multi-host-network --name my-web nginx
716thylsndqma81j6kkkb5aus
```

- Custom network plugins

```
$ docker network create --driver weave mynet
```

## Exposing and publishing ports

```
$ docker run -it -d -p 80 nginx

$ docker ps
64879472feea        nginx               "nginx -g 'daemon ..."   43 hours ago        Up About a minute   443/tcp, 0.0.0.0:32768->80/tcp   blissful_mclean
```

```
$ docker run -it -d -p 8080:80 nginx

$ docker ps
b9788c7adca3        nginx               "nginx -g 'daemon ..."   43 hours ago        Up 3 seconds        80/tcp, 443/tcp, 0.0.0.0:8080->80/tcp   goofy_brahmagupta
```

## Use a proxy server with containers

- Configure the Docker Client

```
{
  "proxies":
  {
    "default":
    {
      "httpProxy": "http://127.0.0.1:3001",
      "noProxy": "*.test.example.com,.example2.com"
    }
  }
}
```

1. On the Docker client, create or edit the file `~/.config.json` in the home directory of the user which starts containers.
2. When you create or start new containers, the environment variables will be set automatically within the container.

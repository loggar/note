# Docker - Configure networking
## Docker container networking

### Default networks

```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
83ae59c7ae1e        bridge              bridge              local
93f1d10ad92f        host                host                local
3d57e8ebb6db        none                null                local
```

* The default bridge network
```
$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "83ae59c7ae1ee04c1402a763ffb994cc5bda9ce21349b6643b789af2083b1858",
        "Created": "2017-11-27T05:49:13.659726608Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
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
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
```
```
$ docker run -itd --name=container1 busybox
Unable to find image 'busybox:latest' locally
latest: Pulling from library/busybox
0ffadd58f2a6: Pull complete
Digest: sha256:bbc3a03235220b170ba48a157dd097dd1379299370e1ed99ce976df0355d24f0
Status: Downloaded newer image for busybox:latest
314c3d788968bba736b8aec3a971fd04d04cc03058ebef047d7e56720a7889b5
```
```
$ docker run -itd --name=container2 busybox
942cba2922db682238a977b4aee432ac0de8bc7b51d13c1125e78196a9c7bf48
```
```
$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "83ae59c7ae1ee04c1402a763ffb994cc5bda9ce21349b6643b789af2083b1858",
        "Created": "2017-11-27T05:49:13.659726608Z",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
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
            "314c3d788968bba736b8aec3a971fd04d04cc03058ebef047d7e56720a7889b5": {
                "Name": "container1",
                "EndpointID": "9bfdda000b498bc3fb01932f7d533aa4db69004acead8800ce6cbd4b3de42744",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "942cba2922db682238a977b4aee432ac0de8bc7b51d13c1125e78196a9c7bf48": {
                "Name": "container2",
                "EndpointID": "0b4a362ca5bfafeed7877b17d4cda8f43ebbaf2ca7fd15bfce4beda437086e93",
                "MacAddress": "02:42:ac:11:00:03",
                "IPv4Address": "172.17.0.3/16",
                "IPv6Address": ""
            }
        },
        "Options": {
            "com.docker.network.bridge.default_bridge": "true",
            "com.docker.network.bridge.enable_icc": "true",
            "com.docker.network.bridge.enable_ip_masquerade": "true",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
            "com.docker.network.bridge.name": "docker0",
            "com.docker.network.driver.mtu": "1500"
        },
        "Labels": {}
    }
]
```
```
$ docker attach container1
/ # ip -4 addr
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
7: eth0@if8: <BROADCAST,MULTICAST,UP,LOWER_UP,M-DOWN> mtu 1500 qdisc noqueue
    inet 172.17.0.2/16 scope global eth0
       valid_lft forever preferred_lft forever

/ # ping -w3 172.17.0.3
PING 172.17.0.3 (172.17.0.3): 56 data bytes
64 bytes from 172.17.0.3: seq=0 ttl=64 time=0.078 ms
64 bytes from 172.17.0.3: seq=1 ttl=64 time=0.197 ms
64 bytes from 172.17.0.3: seq=2 ttl=64 time=0.139 ms
^C
--- 172.17.0.3 ping statistics ---
3 packets transmitted, 3 packets received, 0% packet loss
round-trip min/avg/max = 0.078/0.138/0.197 ms

/ # cat /etc/hosts
127.0.0.1       localhost
::1     localhost ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
172.17.0.2      314c3d788968
```

### User-defined networks

* Bridge networks
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

* The docker_gwbridge network
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

* Overlay networks in swarm mode
```
$ docker network create \
  --driver overlay \
  --subnet 10.0.9.0/24 \
  my-multi-host-network
400g6bwzd68jizzdx5pgyoe95

$ docker service create --replicas 2 --network my-multi-host-network --name my-web nginx
716thylsndqma81j6kkkb5aus
```

* Custom network plugins
```
$ docker network create --driver weave mynet
```

### Exposing and publishing ports

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

### Use a proxy server with containers

* Configure the Docker Client

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
1. On the Docker client, create or edit the file ~/.config.json in the home directory of the user which starts containers.
2. When you create or start new containers, the environment variables will be set automatically within the container.

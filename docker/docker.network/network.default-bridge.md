# Use the default bridge network

```
$ docker network ls
NETWORK ID          NAME                DRIVER              SCOPE
d8b1c4bcd14d        bridge              bridge              local
7dffe9bf12bd        host                host                local
86c609688304        none                null                local
```

```
$ docker ps -a
CONTAINER ID        IMAGE                    COMMAND                  CREATED             STATUS              PORTS                     NAMES
84697b6b23b4        centos-7:test1-replica   "/bin/bash"              9 hours ago         Up 5 seconds        0.0.0.0:80->80/tcp        centos1
632864beb0a3        mariadb:10.2             "docker-entrypoint.s…"   6 weeks ago         Up 18 minutes       0.0.0.0:33301->3306/tcp   mariadb1
```

As you have not specified any `--network` flags when running the containers, the containers connect to the default bridge network.

```
$ docker network inspect bridge
[
    {
        "Name": "bridge",
        "Id": "d8b1c4bcd14d80ec242faeb894ee09c0b46933a6d722083b4e6d1ad3a0f350e9",
        "Created": "2020-05-07T23:13:01.723044847Z",
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
            "632864beb0a30ca76e8ca22cc2b1cc30bc81ca0129ae2ec036d491753dcc2b9e": {
                "Name": "mariadb1",
                "EndpointID": "ead6c61b9d07dc2736b4b43c26408ca3471866a4cacca06c77455dc210b772db",
                "MacAddress": "02:42:ac:11:00:02",
                "IPv4Address": "172.17.0.2/16",
                "IPv6Address": ""
            },
            "84697b6b23b4f4bf90431840dfba78a5fb4776e312d3ddbae4b76b6684f9dba7": {
                "Name": "centos1",
                "EndpointID": "da5057fbb5166595782ecc7b7cb418fc33e115f0ba391deddd0e8482685cedfb",
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

Near the top, information about the bridge network is listed, including the IP address of the gateway between the Docker host and the bridge network (`172.17.0.1`). Under the Containers key, each connected container is listed, along with information about its IP address (`172.17.0.2` for `mariadb1` and `172.17.0.3` for `centos1`).

Now attach a container:

```
$ docker exec -it centos1 /bin/bash
```

Show the network interfaces for the container as they look from within the container:

```
[root@84697b6b23b4 /]# ifconfig

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 172.17.0.3  netmask 255.255.0.0  broadcast 172.17.255.255
        ether 02:42:ac:11:00:03  txqueuelen 0  (Ethernet)
        RX packets 266  bytes 338635 (330.6 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 197  bytes 11478 (11.2 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
```

Try to ping the other container. First, ping it by its IP address, 172.17.0.2:

```
[root@84697b6b23b4 /]# ping -c 2 172.17.0.3

PING 172.17.0.3 (172.17.0.3) 56(84) bytes of data.
64 bytes from 172.17.0.3: icmp_seq=1 ttl=64 time=0.025 ms
64 bytes from 172.17.0.3: icmp_seq=2 ttl=64 time=0.097 ms

--- 172.17.0.3 ping statistics ---
2 packets transmitted, 2 received, 0% packet loss, time 1057ms
rtt min/avg/max/mdev = 0.025/0.061/0.097/0.036 ms
```

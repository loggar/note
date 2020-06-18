# Host Hostname or IP from a container

## Docker for Mac / Docker for Windows

```
host.docker.internal
```

ps:

```
docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' <container_name>
```

bash:

```
$ docker inspect mysql1 | grep IPAddress

            "SecondaryIPAddresses": null,
            "IPAddress": "172.17.0.2",
                    "IPAddress": "172.17.0.2",
```

Gateway:

```
docker inspect <container-id-or-name> | grep Gateway
```

## Docker for Linux

```
$ ip a
```

## for MAC/ Windows/ Linux

```sh
HOST_DOMAIN="host.docker.internal"
ping -q -c1 $HOST_DOMAIN > /dev/null 2>&1
if [ $? -ne 0 ]; then
  HOST_IP=$(ip route | awk 'NR==1 {print $3}')
  echo -e "$HOST_IP\t$HOST_DOMAIN" >> /etc/hosts
fi
```

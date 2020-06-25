# Docker and Mariadb images

## Creating Mariadb Docker Container

Search Image

```
docker search mariadb
```

Install Image

```
docker pull mariadb:10.2
```

List Images

```
docker images
docker image ls
```

Create Container

```
docker run --name mariadb1 -e MYSQL_ROOT_PASSWORD=mypass -p 33301:3306 -d mariadb:10.2

# or options for mysqld

docker run --name mariadb1 -e MYSQL_ROOT_PASSWORD=mypass -p 33301:3306 -d mariadb:10.2 --log-bin --binlog-format=MIXED
```

If want to make the container starts automatically when Docker starts.

```
$ docker update --restart unless-stopped mariadb1
```

List Container (Running)

```
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                     NAMES
5d7dad8c6cdc        mariadb:10.2        "docker-entrypoint.s…"   4 seconds ago       Up 3 seconds        0.0.0.0:33301->3306/tcp   mariadb1
```

## Running and Stopping the Container

```
docker restart mariadb1

docker stop mariadb1

docker start mariadb1
```

Destroy Container with it's volume

```
docker rm -v mariadb1
```

### Pausing Containers

A container can also be frozen with the `pause` command. Docker will freeze the process using croups. MariaDB will not know that it is being frozen and, when we `unpause` it, MariaDB will resume its work as expected.

Both `pause` and `unpause` accept one or more container names. So, if we are running a cluster, we can freeze and resume all nodes simultaneously:

```
docker pause node1 node2 node3
docker unpause node1 node2 node3
```

## Troubleshooting a Container

Show docker container log

```
docker logs mariadb1
```

## Accessing the Container

Via Bash

```
docker exec -it mariadb1 bash
```

```
apt-get update
apt-get install vim
```

## Connecting to MariaDB from Outside the Container

Make maria-service network enabled.

`/etc/mysql/my.cnf`

Comment `bind-address`.

```
#bind-address            = 127.0.0.1
```

Shutdown maria service

```
mysqladmin -u root -p shutdown
```

Start Container again

```
docker start mariadb1
```

Find the IP that has been assigned to the container:

```
docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' mariadb1

'172.17.0.2'
```

Using mysql client from the host

```
mysql -h 127.17.0.2 -P 3306 -u root -p

Enter password: ******
ERROR 2003 (HY000): Can't connect to MySQL server on '127.17.0.2' (10061)
```

From my local machine (Not using docker network)

```
mysql -h 127.0.0.1 -P 33301 -u root -p
```

### Grand mysql access

Inside mariadb container:

```
root@15e718ba2c27:/# mysql -u root -p

Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 12
Server version: 10.2.31-MariaDB-1:10.2.31+maria~bionic-log mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
+------+------+
| User | Host |
+------+------+
| root | %    |
+------+------+
1 row in set (0.001 sec)
```

It is common for people to want to create a "root" user that can connect from anywhere, so as an example, we'll do just that, but to improve on it we'll create a root user that can connect from anywhere on my local area network (LAN), which has addresses in the subnet `192.168.100.0/24`.

```
MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'192.168.100.%' IDENTIFIED BY 'mypass' WITH GRANT OPTION;
Query OK, 0 rows affected (0.000 sec)

MariaDB [(none)]> SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';
+------+---------------+
| User | Host          |
+------+---------------+
| root | %             |
| root | 192.168.100.% |
+------+---------------+
2 rows in set (0.000 sec)
```

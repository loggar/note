# docker mariadb settings

## Setting up

Docker image:

```
docker pull mysql:8.0.17
```

Create Container:

```
docker run --name mysql1 -e MYSQL_ROOT_PASSWORD=mypass -e MYSQL_ROOT_HOST='0.0.0.0' -e MYSQL_DATABASE=MY_DB_NAME -p 33302:3306 -d mysql:8.0.17 --log-bin --binlog-format=MIXED
```

Make the container starts automatically when Docker starts.

```
$ docker update --restart unless-stopped mysql1
```

Rollback restart option

```
$ docker update --restart no mysql1
```

## Grant user

```
docker exec -it mysql1 bash
mysql -u root -p
```

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mypass';
FLUSH PRIVILEGES;
SELECT host FROM mysql.user WHERE User = 'root';

CREATE USER 'user1'@'%' IDENTIFIED WITH mysql_native_password BY 'mypass';
FLUSH PRIVILEGES;
SELECT host FROM mysql.user WHERE User = 'user1';

```

## Connection test

from the host:

```
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysql -h localhost -P 33302 -u user1 -p
```

## Start container

```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                            PORTS                     NAMES
5d7dad8c6cdc        mariadb:10.2        "docker-entrypoint.s…"   56 minutes ago      Exited (255) About a minute ago   0.0.0.0:33301->3306/tcp   mysql1

```

```
$ docker start mysql1
 mysql1
```

## Replicate remote db

```
chmod +x /root/mysql/shell-script/*.sh
```

```
$ docker exec -i -t mysql1 /bin/bash

$ cd /root/mariadb/shell-script

$ ./replicate_sims_dev_to_local.sh

$ ./replicate_sims_prod_to_local.sh
```

Or int the host of the container:

```
$ docker exec mysql1 bash -c "cd /root/mariadb/shell-script && ./replicate_sims_dev_to_local.sh"

$ docker exec mysql1 bash -c "cd /root/mariadb/shell-script && ./replicate_sims_prod_to_local.sh"

$ docker exec mysql1 bash -c "cd /root/mariadb/shell-script && ./import_local_file.sh"
```

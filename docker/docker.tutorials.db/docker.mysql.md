# docker mysql settings

## Setting up

Docker image:

```
docker pull mysql:8.0.17
```

Create Container:

```
docker run --name mysql1 -e MYSQL_ROOT_PASSWORD=mypass -e MYSQL_ROOT_HOST='0.0.0.0' -p 33302:3306 -d mysql:8.0.17 --log-bin --binlog-format=MIXED
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
CREATE DATABASE MY_DATABASE_NM;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'mypass';
CREATE USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'mypass';
GRANT ALL ON *.* TO 'root'@'%';
FLUSH PRIVILEGES;
SELECT User, Host FROM mysql.user WHERE Host <> 'localhost';

```

## Connection test

from the host:

```
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysql -h localhost -P 33302 -u root -p
```

## Start container

```
$ docker ps -a
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS                            PORTS                     NAMES
5d7dad8c6cdc        mysql:10.2        "docker-entrypoint.s…"   56 minutes ago      Exited (255) About a minute ago   0.0.0.0:33302->3306/tcp   mysql1

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

$ /root/mysql/shell-script/replicate_sims_dev_to_local.sh

$ /root/mysql/shell-script/replicate_sims_prod_to_local.sh

$ /root/mysql/shell-script/import_local_file.sh
```

Or int the host of the container:

```
$ docker exec mysql1 bash -c "cd /root/mysql/shell-script && ./replicate_sims_dev_to_local.sh"

$ docker exec mysql1 bash -c "cd /root/mysql/shell-script && ./replicate_sims_prod_to_local.sh"

$ docker exec mysql1 bash -c "cd /root/mysql/shell-script && ./import_local_file.sh"
```

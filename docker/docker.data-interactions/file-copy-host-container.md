# copy files between host and containers

host to container:

```
docker cp ./file.sql mariadb1:/root/mariadb/file.sql
```

container to host:

```
docker cp mariadb1:/root/mariadb/file.sql ./file.sql
```

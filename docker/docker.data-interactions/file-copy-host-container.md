# copy files between host and containers

host to container:

```
docker cp ./file.sql mariadb1:/root/mariadb/file.sql

docker cp .\resources\ centos1:/opt/resources

```

container to host:

```
docker cp mariadb1:/root/mariadb/file.sql ./file.sql

docker cp centos1:/opt/resources .\resources\
```

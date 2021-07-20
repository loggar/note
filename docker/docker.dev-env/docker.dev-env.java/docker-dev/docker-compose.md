# docker compose

docker-compose build and up

```
$ docker-compose build
$ docker-compose up -d

# or

$ docker-compose up -d --build
```

docker-compose down

```
docker-compose down
```

test tomcat webapps

```
http://localhost:38080

http://localhost:38080/manager/html
```

bash into tomcat container

```
$ docker exec -it heiis-docker-dev_heiis-backend_1 bash

# tail -f /opt/tomcat/logs/catalina.2021-07-20.log
# tail -f /opt/tomcat/logs/localhost.2021-07-20.log

```

handle tomcat process

```
$ docker exec -it heiis-docker-dev_heiis-backend_1 bash

/opt/tomcat/bin/catalina.sh run
/opt/tomcat/bin/catalina.sh stop
```

# docker images containers

## docker images

### jdk and tomcat

amazon corretto https://hub.docker.com/_/amazoncorretto

```
# openjdk8, amazon-linux
$ docker pull amazoncorretto:8-al2-full
```

Test corretto

```
$ docker run -it --name corretto8 -d amazoncorretto:8-al2-full

$ docker exec -it corretto8 /bin/bash
# cat /etc/os-release
# uname -r
# printenv | grep JAVA_HOME
```

Test tomcat installation

```
# yum -y update
# yum install -y wget gzip tar git
# wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.50/bin/apache-tomcat-9.0.50.tar.gz -P /tmp
# tar xvf /tmp/apache-tomcat-9.0.50.tar.gz -C /opt
# ln -s /opt/apache-tomcat-9.0.50/ /opt/tomcat
```

Stop and remove test container

```
$ docker stop corretto8 && docker rm -v corretto8
```

Build dockerfile (./tomcat/Dockerfile)

```
$ docker build -t corretto8:tomcat9 .

$ docker images
REPOSITORY        TAG           IMAGE ID       CREATED       SIZE
corretto8         tomcat9       1f8578b95772   2 minutes ago   843MB

```

## docker containers

### `corretto` with `Tomcat 9.0.50`

Run container

```
$ docker run -d --name=corretto8 -p 38080:8080 corretto8:tomcat9
```

Stop and remove container

```
$ docker stop corretto8 && docker rm -v corretto8
```

Test Server

```
http://localhost:38080/
```

# Dockerfile

> Docker is a tool designed to make it easier to create, deploy, and run applications by using containers. Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies, and ship it all out as one package. — OpenSource.com, What is Docker?

## docker samples (github)

> https://github.com/docker

## Dockerfile Commands

- FROM — this initializes a new build stage and sets the Base Image for subsequent instructions. As such, a valid Dockerfile must start with a FROM instruction.
- RUN — will execute any commands in a new layer on top of the current image and commit the results. The resulting committed image will be used for the next step in the Dockerfile.
- ENV — sets the environment variable <key> to the value <value>. This value will be in the environment for all subsequent instructions in the build stage and can be replaced inline in many as well.
- EXPOSE — informs Docker that the container listens on the specified network ports at runtime. You can specify whether the port listens on TCP or UDP, and the default is TCP if the protocol is not specified. This makes it possible for the host and the outside world to access the isolated Docker Container
- VOLUME — creates a mount point with the specified name and marks it as holding externally mounted volumes from the native host or other containers.

## Dockerfile Examples

Node Dockerfile Example

```dockerfile
# creates a layer from the node:carbon Docker image
FROM node:carbon
# create the app directory for inside the Docker image
WORKDIR /usr/src/app
# copy and install app dependencies from the package.json (and the package-lock.json) into the root of the directory created above
COPY package*.json ./
RUN npm install
# bundle app source inside Docker image
COPY . .
# expose port 8080 to have it mapped by Docker daemon
EXPOSE 8080
# define the command to run the app (it's the npm start script from the package.json file)
CMD [ "npm", "start" ]
```

Java Dockerfile Example

```dockerfile
# creates a layer from the openjdk:8-jdk-alpine Docker image
FROM openjdk:8-jdk-alpine
# create the directory for where Tomcat creates its working directories
VOLUME /tmp
# copy the project JAR file to the container renamed as 'app.jar'
COPY build/libs /app
# execute that JAR in the entry point below
ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "/app/java-example.jar"]
```

Python Dockerfile Example

```dockerfile
# creates a layer from the ubuntu:16.04 Docker image
FROM ubuntu:16.04
# adds files from the Docker client’s current directory
COPY . /app
# builds the application with make
RUN make /app
# specifies what command to run within the container
CMD python /app/app.py
```

Jenkins Dockerfile Example

```
# creates a layer from the jenkins:lts Docker image
FROM jenkins/jenkins:lts
 # sets user to root (because Docker always runs as root and Jenkins needs to know this)
  USER root

 # add and install all the necessary dependencies
 RUN apt-get update && \
 apt-get install -qy \
   apt-utils \
   libyaml-dev \
   build-essential \
   python-dev \
   libxml2-dev \
   libxslt-dev \
   libffi-dev \
   libssl-dev \
   default-libmysqlclient-dev \
   python-mysqldb \
   python-pip \
   libjpeg-dev \
   zlib1g-dev \
   libblas-dev\
   liblapack-dev \
   libatlas-base-dev \
   apt-transport-https \
   ca-certificates \
   zip \
   unzip \
   gfortran && \
 rm -rf /var/lib/apt/lists/*

 # install docker
 RUN curl -fsSL get.docker.com -o get-docker.sh && sh get-docker.sh

 # install docker compose
 RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose && \
     chmod +x /usr/local/bin/docker-compose
 # install pip for python
 RUN pip install cffi --upgrade
 RUN pip install pip2pi ansible==2.0

 # copy groovy executors and plugins for jenkins and run the plugins
 COPY executors.groovy /usr/share/jenkins/ref/init.groovy.d/executors.groovy
 COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
 RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

 # add the jenkins user to the docker group so that sudo is not required to run docker commands
 RUN groupmod -g 1026 docker && gpasswd -a jenkins docker
 USER jenkins
```

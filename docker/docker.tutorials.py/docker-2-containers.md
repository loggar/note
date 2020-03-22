# Docker Tutorial

## Containers

### Build docker image

* Start Docker ToolBox (Windows 10)
```
$ C:\_dev\git\bin\bash.exe --login -i "C:\Program Files\Docker Toolbox\start.sh"
```

* Create Dockerfile (Dockerfile)
```
# Use an official Python runtime as a parent image
FROM python:2.7-slim

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r docker-py-requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
ENV NAME World

# Run app.py when the container launches
CMD ["python", "app.py"]
```

* Create dependency definition file (requirements.txt)
```
Flask
Redis
```

* Create App (app.py)
```
"""module docstring."""
import os
import socket
from flask import Flask
from redis import Redis, RedisError

# Connect to Redis
REDIS = Redis(host="redis", db=0, socket_connect_timeout=2, socket_timeout=2)

APP = Flask(__name__)

@APP.route("/")
def hello():
    """function docstring."""
    try:
        visits = REDIS.incr("counter")
    except RedisError:
        visits = "<i>cannot connect to Redis, counter disabled</i>"

    html = "<h3>Hello {name}!</h3>" \
           "<b>Hostname:</b> {hostname}<br/>" \
           "<b>Visits:</b> {visits}"
    return html.format(name=os.getenv("NAME", "world"), hostname=socket.gethostname(), visits=visits)

if __name__ == "__main__":
    APP.run(host='localhost', port=80)
```

```
$ ls
app.py  Dockerfile  readme.md  requirements.txt
```

* Build the docker app
```
$ docker build -t friendlyhello ./

$ docker images
```

* Run docker app
```
$ docker run -p 4000:80 friendlyhello
```

* or Run in background
```
$ docker run -d -p 4000:80 friendlyhello
```

* Test
```
$(echo docker-machine ip default)
192.168.99.100

$ curl http://$(docker-machine ip default):4000
```

* Stop container
```
$ docker container ls
CONTAINER ID        IMAGE               COMMAND             CREATED
1fa4ab2cf395        friendlyhello       "python app.py"     28 seconds ago

$ docker container stop 1fa4ab2cf395
```

### Container

* Running containers
```
$ docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS                  NAMES
bfaa421a3d4d        friendlyhello       "python app.py"     About an hour ago   Up About an hour    0.0.0.0:4000->80/tcp   musing_agnesi
```

* All container
```
$ docker ps -a
```

* Remove containers
```
$ docker rm container_id[, container_id, ...]
```

* Remove all container
```
$ docker rm 'docker ps -a -q'
```

### Image

* Remove image
```
$ docker rmi image_id
```

* Remove image with its containers
```
$ docker rmi -f image_id
```

### Docker Cloud Repository

* Login https://cloud.docker.com
```
$ docker login
Login with your Docker ID to push and pull images from Docker Hub. If you don't have a Docker ID, head over to https://hub.docker.com to create one.
Username: loggar
Password:
Login Succeeded
```

* Tag the image
```
$ docker tag friendlyhello loggar/get-started:part2

$ docker images
REPOSITORY           TAG                 IMAGE ID            CREATED             SIZE
friendlyhello        latest              ae5deffbaab3        2 hours ago         148MB
loggar/get-started   part2               ae5deffbaab3        2 hours ago         148MB
python               2.7-slim            b0259cf63993        12 days ago         138MB
```

* Publish the image
```
$ docker push loggar/get-started:part2

https://cloud.docker.com/swarm/loggar/repository/list
```

* Pull and run the image from the remote repository
```
$ docker run -d -p 4000:80 loggar/get-started:part2
e5b046c8534aa4e338afcb6ae2bd1a72a3380e73541df761b4b83a7456b9539a

$ docker ps
CONTAINER ID        IMAGE                      COMMAND             CREATED             STATUS              PORTS                  NAMES
e5b046c8534a        loggar/get-started:part2   "python app.py"     9 seconds ago       Up 9 seconds        0.0.0.0:4000->80/tcp   youthful_brahmagupta
```

# Docker Compose

> “Docker Compose is a tool for defining and running multi-container Docker applications” — Docker, Overview of Docker Compose

> Docker-Compose defines a complete system where services can communicate with each other on an isolated network, interacting with external resources as defined by the user.

## Sample Docker Compose Yaml

``` yml
# docker-compose.yml

version: "2"
	services:
		name_of_service:
			build: path_to_dockerfile
			# OR
			image: name_of_image
			environment:
			 - "java_home:/user/bin/default"
			 - "app_dir:/opt/app"
			ports:
			 - "80:80"
			 - "8080:8080"
			 - "443:443"
			volumes:
			 - ./:/opt/app
```

``` yml
# docker-compose.yml

version: '3'
services:
  web:
    build: .
    ports:
     - "5000:5000"
  redis:
    image: "redis:alpine"
```

Every docker-compose file will start with a minimum of `version: "2"`, if you’re doing a Docker Swarm file it will need `version: "3"`, but for a single `docker-compose.yml`, you’ll need v2.

## Docker Compose Commands

* docker-compose ps — lists all the services in a network. This is especially helpful when troubleshooting a service as it will give you the container ID and you can then run docker -it exec <ID> bash to enter the container and debug as needed.
* docker-compose build — generates any needed images from custom Dockerfiles. It will not pull images from the Docker hub, only generate custom images.
* docker-compose up — brings up the network for the services to run in
* docker-compose stop — stops the network and saves the state of all the services
* docker-compose start — restarts the services and brings them back up with the state they had when they were stopped
* docker-compose down — burns the entire Docker network with fire. The network and all the services contained within are totally destroyed.
* docker-compose build and docker-compose down mean the Docker environment is not running, and the network does not exist.
* docker-compose up and docker-compose start means the Docker environment is running, and the network does exist.
* docker-compose stop means the Docker environment is not running, but the network still does exist.

#!/bin/bash

# Delete all volumes
docker volume prune

# Delete all containers
docker rm $(docker ps -a -q)

# Delete all images
docker rmi $(docker images -q)

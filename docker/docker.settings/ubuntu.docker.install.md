# Install Docker and Docker Compose within WSL

## Install Docker

```sh
# Update the apt package list.
sudo apt-get update -y

# Install Docker's package dependencies.
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the fingerprint.
sudo apt-key fingerprint 0EBFCD88

# Add the `stable` channel's Docker upstream repository.
#
# If you want to live on the edge, you can change "stable" below to "test" or
# "nightly". I highly recommend sticking with stable!
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE.
sudo apt-get install -y docker-ce

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
```

At this point you must close your terminal and open a new one so that you can run Docker without `sudo`. You might as well do it now!

## Install Docker Compose

We’re going to install Docker Compose using PIP instead of the pre-compiled binary on GitHub because it runs a little bit faster (both are still Python apps).

```sh
# Install Python and PIP.
sudo apt-get install -y python python-pip

# Install Docker Compose into your user's home directory.
pip install --user docker-compose
```

## Basic Docker Commands

```
$ sudo docker info

$ sudo docker version

$ docker

$ sudo docker search centos

$ docker pull centos

$ sudo docker images

$ sudo docker rmi centos
```

## Run a docker container

```
$ docker run centos cat /etc/issue

$ sudo docker ps -l

$ sudo docker start <container-id>

$ sudo docker start <container-name>

$ docker run --name <image-name> centos cat /etc/issue

$ docker run -it centos bash

# uname -a

# cat /etc/redhat-release

# exit

$ docker ps -l
```

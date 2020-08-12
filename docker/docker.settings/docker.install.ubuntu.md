# Install Docker on Ubuntu or WSL Ubuntu

## Uninstall the old version of Docker:

```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

## Installing Docker Community Edition

```sh
# Update the apt package list.
sudo apt-get update -y

# Install Docker's package dependencies.
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common
```

While installing Docker through the repository, if you find any error or problem, you can use the following command to get rid of errors.

```
sudo dpkg --configure -a /
```

## Installing and Verifying the GNU Privacy Guard

```
# Download and add Docker's official public PGP key.
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verifying the GNU Privacy Guard (fingerprint)
sudo apt-key fingerprint 0EBFCD88
```

## Installing the Stable Release of Docker

For x86_64 / amd64:

```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
stable"
```

For armhf:

```
sudo add-apt-repository \
   "deb [arch=armhf] https://download.docker.com/linux/debian \
  $(lsb_release -cs) \
 stable"
```

For arm64:

```
sudo add-apt-repository \
 "deb [arch=arm64] https://download.docker.com/linux/debian \
 $(lsb_release -cs) \
  stable"
```

Docker CE and User access

```
# Update the apt package list (for the new apt repo).
sudo apt-get update -y

# Install the latest version of Docker CE.
sudo apt-get install -y docker-ce

# Allow your user to access the Docker CLI without needing root access.
sudo usermod -aG docker $USER
```

At this point you must close your terminal and open a new one so that you can run Docker without `sudo`. You might as well do it now!

## Installation of Docker Engine

Docker engine is the user engine, where the user can authorize his container part. Docker engine works with server host and client host.

```
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io

# or specify docker-version

$ sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io
```

## Install Docker Compose

We’re going to install Docker Compose using PIP instead of the pre-compiled binary on GitHub because it runs a little bit faster (both are still Python apps).

```sh
# Install Python and PIP.
sudo apt-get install -y python python-pip

# Install Docker Compose into your user's home directory.
pip install --user docker-compose
```

## And..

Checking Docker version:

```
sudo docker -v
docker --version
```

Checking Docker Status

```
sudo systemctl status docker
```

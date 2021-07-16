# Docker Registry

## Install your Registry (on your server or locally)

> https://github.com/docker-archive/docker-registry

```
git clone https://github.com/dotcloud/docker-registry.git
cd docker-registry
cp config_sample.yml config.yml
pip install -r requirements.txt
gunicorn --access-logfile - --log-level debug --debug
    -b 0.0.0.0:5000 -w 1 wsgi:application
```

## Using Push and Pull

```
# First, make sure you have the "ubuntu" repository:
docker pull ubuntu

# Then, find the image id that corresponds to the ubuntu repository
docker images | grep ubuntu | grep latest
ubuntu  latest  8dbd9e392a96  12 weeks ago  263 MB (virtual 263 MB)

# Almost there!
# Tag to create a repository with the full registry location.
# The location becomes a permanent part of the repository name.
docker tag 8dbd9e392a96 localhost.localdomain:5000/ubuntu

# Finally, push the new repository to its home location.
docker push localhost.localdomain:5000/ubuntu
```

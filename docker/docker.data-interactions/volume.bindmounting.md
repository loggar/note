# Bindmounting a Volume

## Bindmounting

Share a drive with docker desktop

```
Docker settings > Resources > File Sharing > Selecte Drive names.
```

Run a container with bindmounting a volume:

```
docker run --detach -v c:/Users/webnl/Documents/\_workspace_volume_mounted/nginx1/nginxlogs:/var/log/nginx -p 41010:80 --name webserver nginx
```

Visit mounted host directory

```
C:\Users\webnl\Documents\_workspace_volume_mounted\nginx1\nginxlogs
```

## Volume Mounting SSH Keys into a Docker Container

```
docker run --rm -it -v ~/.ssh:/root/.ssh:ro alpine .
```

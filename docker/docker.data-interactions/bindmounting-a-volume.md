# Bindmounting a Volume

Share a drive with docker desktop

```
Docker settings > Resources > File Sharing > Selecte Drive names.
```

Run a container with bindmounting a volume:

```
docker run --detach -v c:/Users/webnl/Documents/\_volume_mounted/nginx/nginxlogs:/var/log/nginx -p 41010:80 --name webserver nginx
```

Visit mounted host directory

```
C:\Users\webnl\Documents\_volume_mounted\nginx\nginxlogs
```
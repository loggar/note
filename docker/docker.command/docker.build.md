# docker build

```
# build an image
docker build -t <image-name>:<tag> .

docker build --no-cache -t image-name:latest .

# build and log output in a file
docker build --no-cache -t image-name:latest . > docker-build.log 2>&1
```

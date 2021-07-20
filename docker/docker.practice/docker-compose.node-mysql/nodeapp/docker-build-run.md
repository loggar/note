```
docker build -t demo-docker/npmdemo .
```

```
docker run demo-docker/npmdemo
```

```
docker run demo-docker/npmdemo npm --version
```

Work with Docker directly (no configuration file)

```
docker run \
  --rm \
  -p "4040:4040" \
  -v ${PWD}:/home/node/project \
  node:14 \
  node /home/node/project/app.js
```
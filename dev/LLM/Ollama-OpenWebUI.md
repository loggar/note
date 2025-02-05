# Ollama & Open Web UI

https://github.com/open-webui/open-webui

## Run Ollama

```
$ ollama run deepseek-r1:8b
> /bye

# http://localhost:11434/
# Ollama is running
```

## Run Open Web UI

```sh
docker run -d -p 21434:8080 \
    --add-host=host.docker.internal:host-gateway \
    -v open-webui:/app/backend/data \
    --name open-webui \
    --restart always ghcr.io/open-webui/open-webui:main
```

http://localhost:21434/auth
http://localhost:21434/

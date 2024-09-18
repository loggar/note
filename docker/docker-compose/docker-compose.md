# Docker compose

## compose up with `-f` `<docker-compose-file>`

To run docker compose up using the file located at `~/abc/docker-compose.api1.local.yaml` as if it were in your current directory, you can use the`-f` (or `--file`) option to specify the compose file and the `--project-directory` option to set the project directory to your current location. This ensures that any relative paths within the compose file are resolved relative to your current directory rather than the location of the compose file.

Here's the command you should use:

```
docker compose -f ~/abc/docker-compose.api1.local.yaml --project-directory . up
```

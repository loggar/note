# Cron With Docker Containers

## Using the Host’s Crontab

Run a command within an existing container:

```
*/5 * * * * docker exec example_app_container /example-scheduled-task.sh
```

Create a new container which exists solely to run the task:

```
*/5 * * * * docker run --rm example_app_image:latest /example-scheduled-task.sh
```

## Using Cron Within Your Containers

`example-crontab`

```
*/5 * * * * /usr/bin/sh /example-scheduled-task.sh
```

`Dockerfile`

```dockerfile
RUN apt-get update && apt-get install -y cron
COPY example-crontab /etc/cron.d/example-crontab
RUN chmod 0644 /etc/cron.d/example-crontab &&\
    crontab /etc/cron.d/example-crontab
```

## Separating Cron From Your Application’s Services

`docker-compose`

```yaml
version: "3"

services:
  app:
    image: demo-image:latest
    volumes:
      - data:/app-data
  cron:
    image: demo-image:latest
    entrypoint: /bin/bash
    command: ["cron", "-f"]
    volumes:
      - data:/app-data

volumes:
  data:
```

## Using Kubernetes Cron Jobs

```yaml
apiVersion: batch/v1beta1
kind: CronJob
metadata:
  name: my-cron
  namespace: my-namespace
spec:
  schedule: "*/5 * * * *"
  concurrencyPolicy: Forbid
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            - name: my-container
              image: my-image:latest
              command: ["/bin/bash", "/my-cron-script.sh"]
          restartPolicy: OnFailure
```

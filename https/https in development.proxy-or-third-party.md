# HTTPS In Development

## HTTPS From a Reverse Proxy Or A Third-Party App

Usually, end-users don't directly reach the application server. Instead, user requests are handled by a load balancer or a reverse proxy that distributes requests across backends, stores the cache, protects from unwanted requests, and so on. It's not uncommon to see these proxies take the role of decrypting requests and encrypting responses as well.

On a development environment, we can use a reverse proxy, too!

### Encryption via Traefik and Docker Compose

Traefik is a reverse proxy that comes with a lot of advantages for developers. Among others, it's simple to configure and it comes with a GUI. Also, there is an official docker image available on docker hub.

So, let's use it inside the `docker-compose.yml` of a hypothetical application that only serves static files:

```yml
version: "3.4"

services:
  reverse-proxy:
    image: traefik # The official Traefik docker image
    command: --docker --api # Enables the web UI and tells Traefik to listen to docker
    ports:
      - "3000:443" # Proxy entrypoint
      - "8000:8080" # Dashboard
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock # So that Traefik can listen to the Docker events
      - ./certs/server.crt:/sslcerts/server.crt
      - ./certs/server.key:/sslcerts/server.key
      - ./traefik.toml:/traefik.toml # Traefik configuration file (see below)
    labels:
      - "traefik.enable=false"
    depends_on:
      - static-files
  static-files:
    image: halverneus/static-file-server
    volumes:
      - ./static:/web
    labels:
      - "traefik.enable=true"
      - "traefik.frontend.rule=Host:localhost"
      - "traefik.port=8080"
      - "traefik.protocol=http"
    ports:
      - 8080:8080
```

In this example, our static file server listens on port 8080 and serves files in HTTP. This configuration tells Traefik to handle HTTPS requests to https://localhost and proxy each of them to http://localhost:8080 in order to serve static files.

We also have to add a `traefik.toml` to configure the Traefik entry points:

```
debug = false

logLevel = "ERROR"
defaultEntryPoints = ["https","http"]

[entryPoints]
  [entryPoints.http]
  address = ":80"
    [entryPoints.http.redirect]
    entryPoint = "https"
  [entryPoints.https]
  address = ":443"
  [entryPoints.https.tls]
      [[entryPoints.https.tls.certificates]]
      certFile = "/sslcerts/server.crt"
      keyFile = "/sslcerts/server.key"
```

Here, we have two entry points: http and https, listening respectively to ports 80 and 443. The first one redirects to the HTTPS, and the second is configured to encrypt requests thanks to the specified TLS certificates.

### Encryption From Docker Compose via Nginx

Obviously, we can do exactly the same with the popular Nginx reverse proxy. As Nginx can also directly serve static files itself, the setup is simpler. Again, the first step is the `docker-compose.yml`:

```yml
version: "3"

services:
  web:
    image: nginx:alpine
    volumes:
      - ./static:/var/www
      - ./default.conf:/etc/nginx/conf.d/default.conf
      - ../../certs/server.crt:/etc/nginx/conf.d/server.crt
      - ../../certs/server.key:/etc/nginx/conf.d/server.key
    ports:
      - "3000:443"
```

And the nginx configuration at `default.conf`:

```conf
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    return 301 https://$server_name$request_uri;
}

server {
    listen 443 ssl;

    server_name ~.;

    ssl_certificate /etc/nginx/conf.d/server.crt;
    ssl_certificate_key /etc/nginx/conf.d/server.key;

    location / {
        root /var/www;
    }

    ## If the static server was another docker service,
    ## It is possible to forward requests to its port:
    # location / {
    #     proxy_set_header Host $host;
    #     proxy_set_header X-Real-IP $remote_addr;
    #     proxy_pass http://web:3000/;
    # }
}
```

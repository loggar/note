# Docker NGINX

## Running a basic web server

```
$ docker run -it --rm -d -p 8080:80 --name web nginx
```

```
$ docker stop web
```

`/usr/share/nginx/html/index.html`

```html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Docker Nginx</title>
  </head>
  <body>
    <h2>Hello from Nginx container</h2>
  </body>
</html>
```

Mount a volume

```
$ docker run -it --rm -d -p 8080:80 --name web -v ~/site-content:/usr/share/nginx nginx
```

## Build Custom NGINX Image

```dockerfile
FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
```

```
$ docker build -t webserver .
```

```
$ docker run -it --rm -d -p 8080:80 --name web webserver
```

## Setting up a reverse proxy server

```
$ git clone https://github.com/pmckeetx/docker-nginx.git
```

Once you’ve cloned the repo, open the project in your favorite IDE. Take a look at Dockerfile in the `frontend` directory.

```dockerfile
FROM node:12.18.2 as build

ARG REACT_APP_SERVICES_HOST=/services/m

WORKDIR /app

COPY ./package.json /app/package.json
COPY ./package-lock.json /app/package-lock.json

RUN yarn install
COPY . .
RUN yarn build


FROM nginx
COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/build /usr/share/nginx/html
```

The Dockerfile sets up a multi-stage build. We first build our React.js application and then we copy the nginx.conf file from our local machine into the image along with our static html and javascript files that were built in the first phase.

We configure the reverse proxy in the `frontend/nginx/nginx.conf` file.

```conf
server {
 listen 80;
 server_name frontend;
 location / {
   # This would be the directory where your React app's static files are stored at
   root /usr/share/nginx/html;
   try_files $uri /index.html;
 }

 location /services/m {
   proxy_set_header X-Real-IP $remote_addr;
   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
   proxy_set_header X-NginX-Proxy true;
   proxy_pass http://backend:8080/services/m;
   proxy_ssl_session_reuse off;
   proxy_set_header Host $http_host;
   proxy_cache_bypass $http_upgrade;
   proxy_redirect off;
 }
}
```

As you can see in the second location section thatall traffic targeted to `/services/m` will be `proxy_pass` to `http://backend:8080/services/m`

In the root of the project is a Docker Compose file that will start both our frontend and backend services. Let’s start up our application and test if the reverse proxy is working correctly.

```
$ docker-compose -up
Creating network "docker-nginx_frontend" with the default driver
Creating network "docker-nginx_backend" with the default driver
Creating docker-nginx_frontend_1 ... done
Creating docker-nginx_backend_1  ... done
Attaching to docker-nginx_backend_1, docker-nginx_frontend_1
frontend_1  | /docker-entrypoint.sh: Configuration complete; ready for start up
backend_1   | Listening on port 8080
```

Open your browser and navigate to `http://localhost`. You should see the front web page.

Open the developer tools window and click on the “network” tab. Now back in the browser, enter an entity name. This can be anything. I’m going to use “widgets”. Then click the “Submit” button.

Over in the developer tools window, click on the network request for widgets and see that the request was made to `http://localhost` and not to `http://localhost:8080`.

### Shipping Our Image

```
$ docker login
$ docker tag nginx-frontend <dockerid>/nginx-frontend
$ docker push <dockerid>/nginx-frontend
```

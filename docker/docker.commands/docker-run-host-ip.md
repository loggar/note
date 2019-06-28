# Where the container runs

```
$ docker run -p 49160:8080 -d loggar/node-web-app

$ curl -i localhost:49160
curl: (7) Failed to connect to localhost port 49160: Connection refused

$ docker-machine ip default
99.99.99.100

$ curl -i 99.99.99.100:49160
HTTP/1.1 200 OK
```

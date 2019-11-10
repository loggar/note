# httpbin.org

## web

```
λ curl http://httpbin.org/ip
{
  "origin": "112.213.160.228, 112.213.160.228"
}
```

```
λ curl http://httpbin.org/user-agent
{
  "user-agent": "curl/7.55.1"
}
```

```
λ curl http://httpbin.org/get
{
  "args": {},
  "headers": {
    "Accept": "*/*",
    "Host": "httpbin.org",
    "User-Agent": "curl/7.55.1"
  },
  "origin": "112.213.160.228, 112.213.160.228",
  "url": "https://httpbin.org/get"
}
```

```
λ curl -I http://httpbin.org/status/418
HTTP/1.1 418 I'M A TEAPOT
Access-Control-Allow-Credentials: true
Access-Control-Allow-Origin: *
Content-Length: 135
Date: Sat, 23 Feb 2019 08:59:54 GMT
Server: nginx
x-more-info: http://tools.ietf.org/html/rfc2324
Connection: keep-alive
```

## local

### docker

```
# ($ docker pull kennethreitz/httpbin)

$ docker run -p 80:80 kennethreitz/httpbin
```

```
λ curl http://httpbin.org/ip
```

```
λ curl http://httpbin.org/user-agent
```

```
λ curl http://httpbin.org/get
```

```
λ curl -I http://httpbin.org/status/418
```
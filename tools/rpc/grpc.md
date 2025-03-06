# gRPCurl

```
brew install grpcurl

grpcurl -plaintext localhost:50059 list

grpcurl \
    -plaintext \
    -d '{"a1": "v1","a2": 10,"a3":"/path/ex","a4":["i1","i2"]}' \
    localhost:50059 \
    grpc.MethodPath/TheMethod
```

## gRPCui

https://learn.microsoft.com/en-us/aspnet/core/grpc/test-tools
https://github.com/fullstorydev/grpcui#installation

```
brew install grpcui

grpcui -plaintext localhost:<grpc-port>
```

## Issues

Multiple grpc processes are using one port:

```
$ lsof -i :50051
```

```
COMMAND     PID       USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
rapportd   1080        lee    8u  IPv4                         0t0  TCP *:50051 (LISTEN)
rapportd   1080        lee    9u  IPv6                         0t0  TCP *:50051 (LISTEN)
___go_bui 21792        lee    5u  IPv4                         0t0  TCP localhost:50051 (LISTEN)
```

Kill all:

```
$ sudo lsof -i :50051 -t | xargs kill -9
```

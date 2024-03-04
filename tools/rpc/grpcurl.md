# grpcurl

```
brew install grpcurl

grpcurl -plaintext localhost:50059 list

grpcurl \
    -plaintext \
    -d '{"a1": "v1","a2": 10,"a3":"/path/ex","a4":["i1","i2"]}' \
    localhost:50059 \
    grpc.MethodPath/TheMethod
```

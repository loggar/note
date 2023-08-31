# dns lookup from ip address

## cli

```bash
nslookup 8.8.8.8
# or
dig -x 8.8.8.8
```

## Programmatically

```py
import socket

try:
    domain_name = socket.gethostbyaddr("127.0.0.1")
    print(domain_name[0])
except socket.herror:
    print("Unable to resolve")
```

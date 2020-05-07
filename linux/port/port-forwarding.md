# Port forwarding

Sometimes I have to connect to database and of course I prefer to use my GUI manager (JetBrains DataGrip).
So, if security policy exist in your company and your database's port is not exposed you can execute

```
ssh -L{port on your PC}:localhost:{database's port} root@{server IP}
```

The command below will open port `3308` on your laptop and everything will be forwarded to `192.168.1.2:3306`

```
ssh -L3308:localhost:3306 root@192.168.1.2
```

localhost means that database is listening on `192.168.1.2`. You can type for example `192.168.3.77` and everything will be forwarded to `.3.77` server via `.1.2`.

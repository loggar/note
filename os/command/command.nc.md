# nc – utility for TCP, UDP, or UNIX-domain sockets

To scan for open TCP port 22 on a remote machine with the IP address 192.168.1.11, you would use the following command:

```
$ nc -zv 192.168.1.11 22
```

To scan for open TCP port 22 and 80 on a remote machine with the IP address 192.168.1.11, you would use the following command:

```
$ nc -zv 192.168.1.11 22 80
```

To scan for open TCP ports on a remote machine with the IP address 192.168.1.11 in the port range of 20 to 8080, you would use the following command:

```
$ nc -zv 192.168.1.11 20-8080
```

Notice there’s a ton of connection refused for all the thousands of closed ports. If you would like to show only open ports you can use:

```
$ nc -zv 192.168.1.11 1-8080 2>&1 | grep succeeded
```

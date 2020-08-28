# How To Open A Port In CentOS / RHEL 7

Server Details:

```
# uname -a
Linux geeklab 3.10.0-693.17.1.el7.x86_64 #1 SMP Thu Jan 25 20:13:58 UTC 2018 x86_64 x86_64 x86_64 GNU/Linux

# cat /etc/redhat-release
CentOS Linux release 7.4.1708 (Core)
```

## Check Port Status

```
# netstat -na | grep 55555

# lsof -i -P |grep http
```

Check Port Status in iptables:

```
# iptables-save | grep 55555
```

## Add the port

```
# vi /etc/services
service-name  port/protocol  [aliases ...]   [# comment]

# vi /etc/services
testport        55555/tcp   # Application Name
```

## Open firewall ports

```
# firewall-cmd --zone=public --add-port=55555/tcp --permanent
success

# firewall-cmd --reload
success

# iptables-save | grep 55555
-A IN_public_allow -p tcp -m tcp --dport 55555 -m conntrack --ctstate NEW -j ACCEPT
```

## Check newly added port status

```
# lsof -i -P |grep http
httpd     6595   root    4u  IPv6  43709      0t0  TCP *:80 (LISTEN)
httpd     6595   root    6u  IPv6  43713      0t0  TCP *:55555 (LISTEN)

# netstat -na |grep 55555
tcp6       0      0 :::55555                :::*                    LISTEN

```
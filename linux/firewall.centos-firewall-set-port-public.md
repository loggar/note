## set firewall for allow public access

### refs

* https://www.digitalocean.com/community/tutorials/how-to-set-up-a-firewall-using-firewalld-on-centos-7

### tutorial

centos version

```
# cat /etc/centos-release
CentOS Linux release 7.5.1804 (Core)
```

check firewall service

```
# firewall-cmd --version
0.4.4.4
```

install firewall service if not exist

```
# sudo yum install firewalld
# sudo systemctl enable firewalld
# sudo reboot
# sudo firewall-cmd --state
```

show firewall state

```
# sudo firewall-cmd --state
running

# sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp5s0
  sources:
  services: dhcpv6-client nfs ssh http https
  ports: 8009/tcp 443/tcp 80/tcp 9994/tcp 9995/udp 7071/tcp 9996/tcp 8080/tcp 8081/tcp 3306/tcp 8443/tcp 161/udp 9995/tcp 9996/udp 161/tcp 7                          073/tcp 8082/tcp 10051/tcp 10050/tcp 28101-28199/tcp
  protocols:
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:

```

set firewall

```
# sudo firewall-cmd --permanent --zone=public --add-port=28101-28199/tcp
success

# systemctl stop firewalld
# firewall-cmd --state
not running

# systemctl start firewalld
running
```

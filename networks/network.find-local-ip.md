# Local Network Host IP

## Find Your Local Network IP Address on MacOS / Linux:

```
# install net-tools if haven't, for example in centOS:
$ yum install net-tools
```

```
$ ifconfig
# or $ ip a

eth2      Link encap:Ethernet  HWaddr d0:50:99:4a:e8:68
          inet addr:192.168.1.3  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::c542:1540:8737:c9cd/64 Scope:Global
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
```

## Find Your Local Network IP Address on Windows:

```
$ ipconfig

Ethernet adapter vEthernet (External Virtual Network):

   Connection-specific DNS Suffix  . : home
   Link-local IPv6 Address . . . . . : fe80::c542:1540:8737:c9cd%11
   IPv4 Address. . . . . . . . . . . : 192.168.1.3
   Subnet Mask . . . . . . . . . . . : 255.255.255.0
   Default Gateway . . . . . . . . . : 192.168.1.1
```

# How to Obtain Accurate Server Time in CentOS

```
# yum install ntp ntpdate

# systemctl start ntpd
# systemctl enable ntpd
# systemctl status ntpd
```

Then run the ntpdate command below to add the specified CentOS NTP servers. Here, the `-u` switch tells ntpdate to use an unprivileged port for outgoing packets and `-s` enables for logging output from the standard output (default) to the system syslog facility.

```
# ntpdate -u -s 0.centos.pool.ntp.org 1.centos.pool.ntp.org 2.centos.pool.ntp.org

# systemctl restart ntpd
```

Now check using the timedatectl command if NTP synchronization is enabled and if it is actually synchronized.

```
# timedatectl
```

Lastly, using the hwclock utility, set the hardware clock to the current system time using the `-w` flag as follows.

```
# hwclock  -w
```

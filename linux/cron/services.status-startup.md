# List Services and Startups (Centos)

For current versions of Ubuntu, you probably have a mix of Upstart, and SystemV. Newer versions of Ubuntu after 15.04 "Vivid Vervet" (and other Linux distros like RHEL/CentOS 7) are moving to use SystemD.

## [Upstart](http://upstart.ubuntu.com/cookbook/)

To list all services:

```
initctl list
```

To list all Upstart services and run `initctl show-config` on them, this one-liner may be helpful:

```
initctl list | awk '{ print $1 }' | xargs -n1 initctl show-config
```

## `systemctl`

You can use the systemd command to list all the services on your Linux system:

```
systemctl list-unit-files --type service -all
```

Combine it with the grep command and you can display just the running services:

```
sudo systemctl | grep running
```

```
systemctl start <service-name>

systemctl restart <service-name>

systemctl stop <service-name>

systemctl status <service-name>
```

## `service`

```
service --status-all

service <service-name> start

service <service-name> stop

service <service-name> restart

service <service-name> status
```

## [System V](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/installation_guide/s1-boot-init-shutdown-sysv)

To list all services:

```
service --status-all
```

or:

```
# for init scripts:
ls /etc/init.d/

# for runlevel symlinks:
ls /etc/rc*.d/
```

## [SystemD]

* [SystemD for Upstart Users](https://wiki.ubuntu.com/SystemdForUpstartUsers)
* [Understanding and administering systemd](https://docs.fedoraproject.org/en-US/quick-docs/understanding-and-administering-systemd/index.html)
* [Redhat: Managing Services with SystemD](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/system_administrators_guide/chap-managing_services_with_systemd)
* [Overview of systemd for RHEL 7](https://access.redhat.com/articles/754933)

To list all services:

```
systemctl list-unit-files --type=service
```

or:

```
ls /lib/systemd/system/*.service /etc/systemd/system/*.service
```

## Current Running Upstart List

```
ls -l /etc/rc*.d/* | gawk 'match($0, /rc([0-6S]).d.*\/(.*)$/, a) {l[a[2]]=l[a[2]]a[1]","}; END{for(v in l){print v,substr(l[v],1,length(l[v])-1)}}'
```
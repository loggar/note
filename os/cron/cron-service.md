# cron service

## RHEL/CentOS v4.x/5.x/6.x and Fedora Linux (older version) Verify Cron Service

```
pgrep crond

service crond status

```

If it is not running type the following two command to start crond:

```
# chkconfig crond on
# service crond start
```

Verify cron is running by viewing log file

```
# tail -f /var/log/cron
```

## CentOS/RHEL v7.x+ and latest version of Fedora Linux

```
systemctl status crond.service
```

```
sudo systemctl enable crond.service
sudo systemctl start crond.service
```

## Debian / Ubuntu Linux (older version) Cron service

```
tail -f /var/log/messages

pgrep cron

update-rc.d cron defaults
/etc/init.d/cron start
```

## Debian Linux v8.x+ and latest version of Ubuntu Linux

```
systemctl status cron

sudo systemctl enable cron.service
sudo systemctl start cron.service
```

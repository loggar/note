# Cron Job

## 24-hour cron

Creating a 24-hour cron job is as easy as putting our script into the `/etc/cron.daily` directory. We must use the sudo command to copy the file as the root user, to avoid permission issues. Run the following command to copy sample-work.sh to the `/etc/cron.daily` directory.

```
sudo cp sample-work.sh /etc/cron.daily
```

These changes are immediate.

## others

```
# crontab -e */10 * * * * /bin/bash /opt/script/disk-usage-alert.sh

# 4 AM every day
# crontab -e 0 4 * * * /bin/sh /path/to/backup_script.sh >> /dev/null 2>&1
```

To run a job every twelve hours, the syntax is:

```
0 */12 * * *
```

## cron help tool

```
https://crontab.guru/
```

## running

If you’re curious whether your cron job is currently running, find the PID of cron with:

```
pstree -ap | grep cron
```

then run

```
pstree -ap <PID>
```

## Create log files for scripts executed by crontab

```
0 22 * * 1-5 /opt/scripts/send-report.sh 2>/var/log/scripts/report-error.log
```

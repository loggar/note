# Run process once a day with a Cron Job

## 24-hour cron

Creating a 24-hour cron job is as easy as putting our script into the `/etc/cron.daily` directory. We must use the sudo command to copy the file as the root user, to avoid permission issues. Run the following command to copy sample-work.sh to the `/etc/cron.daily` directory.

```
sudo cp sample-work.sh /etc/cron.daily
```

These changes are immediate.

## others

```
# crontab -e */10 * * * * /bin/bash /opt/script/disk-usage-alert.sh
```

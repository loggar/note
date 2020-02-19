# cron

## Create log files for scripts executed by crontab

```
0 22 * * 1-5 /opt/scripts/send-report.sh 2>/var/log/scripts/report-error.log
```

# mysql backup script

```sh
#!/bin/bash

USER='username'
PASSWORD='password'
DATABASE='ALL_DB'
# Directory should always be mentioned with a trailing slash
DIRECTORY='/path/for/db_backup/'
DOW=$(date +"%A")

# Delete backups which are 7 days old
rm -f $DIRECTORY$DATABASE-$DOW.sql.gz > /dev/null 2>&1

#Backup the DB and Compress it
/usr/bin/mysqldump --user=$USER --password=$PASSWORD --host=$HOST --all-databases --skip-lock-tables > $DIRECTORY$DATABASE-$DOW.sql
/bin/gzip $DIRECTORY$DATABASE-$DOW.**sql**
```

Provide execute permission to the script

```
$ chmod 755 backup_script.sh
```

Add the following line to your crontab. This will automatically execute a backup daily at 0400 hours.

```
$ crontab -e

0 4 * * * /bin/sh /path/to/backup_script.sh >> /dev/null 2>&1
```

## export 

```
mysqldump -u root -p --opt [database name] > [database name].sql

mysqldump --databases test > dump.sql

mysqldump --databases db1 db2 db3 > dump.sql

mysqldump --all-databases > dump.sql
```

### export procedures, functions, events only

```
mysqldump -uroot -p --routines --events --no-data --no-create-db --no-create-info elearning > ouputfile_dump.sql
```

## import 

```
mysql -u root -p newdatabase < /path/to/newdatabase.sql
```

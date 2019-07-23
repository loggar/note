# mysqldump

Dump `elearning` database

```
mysqldump -u root -p  elearning > elearning_data.sql
```

Following command will take backup of entire database including stored procedures. For example your database name is `mydb`.

```
mysqldump -u root -p --routines mydb > mydb.sql
```

To take backup of only Stored Procedures and Triggers ( No data and tables ) use following command.

```
mysqldump --routines --no-create-info --no-data --no-create-db --skip-opt mydb > mydb.sql
```

Entire mysql instance with host

```
mysqldump -h<HOST> -u<USER> -p --hex-blob --routines --triggers --all-databases | gzip > MySQLData.sql.gz
```

## Restore Stored Procedures

```
mysql -u root -p mydb < mydb.sql
```

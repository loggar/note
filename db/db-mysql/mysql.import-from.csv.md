# CSV to Mysql Table

## Import CSV file

```sql
LOAD DATA LOCAL INFILE
  'C:/Users/webnl/Documents/_workspace_tmp/testfiles/some-file.csv'
INTO TABLE test1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(field_1, field_2, field_3)  -- optional
;
```

## Import SCV file with update date formatting

```sql
LOAD DATA LOCAL INFILE
  'C:/Users/webnl/Documents/_workspace_tmp/testfiles/some-file.csv'
INTO TABLE test1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(field_1, @upd_date)
SET upd_date = STR_TO_DATE(@upd_date, '%m/%d/%Y');
;
```

## Import SCV file with current datetime

```sql
LOAD DATA LOCAL INFILE
  'C:/Users/webnl/Documents/_workspace_tmp/testfiles/some-file.csv'
INTO TABLE test1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(field_1, @upd_date)
SET upd_date = NOW(3);
;
```

## Import CSV file with skipping columns

```sql
LOAD DATA LOCAL INFILE
  'C:/Users/webnl/Documents/_workspace_tmp/testfiles/some-file.csv'
INTO TABLE test1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(field_1, @dummy, @dummy, field_3)  -- optional
;
```

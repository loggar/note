# postgreSQL

## cli

```
$ psql -U <user>
```

```
# help
\h
\?

# quit
\q
```

```
# list user
\u

# list database
\l

# connect database
\c <name>
```

```
# format output on/off
\x
```

## database

```
# show databases
SELECT datname FROM pg_database;

# use database
\c db_name
```

## table

```
# list table
\dt
\d

# list table details
\dt+
\d+
```

table schema:

```sql
SELECT
    table_name,
    column_name,
    data_type
FROM
    information_schema.columns
WHERE
    table_name = 'table_name';
```

```sql
select * from table_name
order by updated_ts desc
limit 10;
```

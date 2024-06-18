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

# format align on/off
\a

# set format column delimiter
\f |
\f '| '
\f '\n'
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

# list table LIKE
\dt *pattern*

# list table regex
\d+ .*pattern.*
```

select table names:

```
SELECT tablename
FROM pg_tables
WHERE schemaname = 'public'
  AND tablename ~ '\d+data';
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

# psql time

## Current time

```sql
select now() at time zone 'utc';

select timezone('utc', now());

SELECT CURRENT_TIMESTAMP AT TIME ZONE 'AEST';
```

## Convert to another timezone

```sql
update a
set a_time = ('2023-07-25 08:59:59.999'::TIMESTAMP AT TIME ZONE 'AEST' AT TIME ZONE 'GMT')
where a_time = ('2023-07-24 08:59:59.999'::TIMESTAMP AT TIME ZONE 'AEST' AT TIME ZONE 'GMT')
```

```sql
SELECT NOW() AT TIME ZONE 'UTC' AT TIME ZONE 'Australia/Sydney';
SELECT '2024-04-22 14:00:00'::TIMESTAMP AT TIME ZONE 'UTC' AT TIME ZONE 'Australia/Sydney';
```

## Insert UTC timestamp

```sql
INSERT INTO your_table (timestamp_column, other_columns...)
VALUES ('2024-04-21 14:00:00'::TIMESTAMP AT TIME ZONE 'UTC', other_values...);

INSERT INTO your_table (timestamp_column, other_columns...)
VALUES ('2024-04-21 14:00:00'::TIMESTAMP WITHOUT TIME ZONE, other_values...);

INSERT INTO my_table (timestamp_column, other_columns...)
VALUES (CURRENT_TIMESTAMP AT TIME ZONE 'UTC', other_values...);

INSERT INTO my_table (timestamp_column, other_columns...)
VALUES (now(), other_values...);
```

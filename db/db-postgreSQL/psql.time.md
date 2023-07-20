# psql time

## current time

```sql
select now() at time zone 'utc';

select timezone('utc', now());

SELECT CURRENT_TIMESTAMP AT TIME ZONE 'AEST';
```

## convert to another timezone

```sql
update a
set a_time = ('2023-07-25 08:59:59.999'::TIMESTAMP AT TIME ZONE 'AEST' AT TIME ZONE 'GMT')
where a_time = ('2023-07-24 08:59:59.999'::TIMESTAMP AT TIME ZONE 'AEST' AT TIME ZONE 'GMT')
```

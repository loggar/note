# Insert Dump

Insert dump with uuid generated id, and created timestamp. (from 2hours ago for this case)

```sql
CREATE EXTENSION IF NOT EXISTS pgcrypto;

INSERT INTO table1 (a_uuid, column1, column2, column3, created_ts)
SELECT
    gen_random_uuid(),
    'value1',
    'value2',
    'value3',
    (NOW() - INTERVAL '2 HOUR') - (s.id || ' SECOND')::INTERVAL
FROM
    generate_series(1, 10000) AS s(id);
```

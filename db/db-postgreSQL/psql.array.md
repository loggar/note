# psql array

## array join

```sql
SELECT id1, id2
FROM
    unnest(ARRAY['a', 'b', 'c', 'd']) AS id1
CROSS JOIN
    unnest(ARRAY[186, 187]) AS id2;
```

```sql
SELECT id1, id2
FROM
    unnest(ARRAY['a', 'b', 'c', 'd']) AS id1,
    unnest(ARRAY[186, 187]) AS id2;
```

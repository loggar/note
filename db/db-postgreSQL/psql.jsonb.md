# JSONB

## Find values

```sql
SELECT DISTINCT (jsonb_column ->> 'your_field')
FROM your_table;

SELECT DISTINCT (jsonb_column #>> '{first, child}')
FROM your_table;
```

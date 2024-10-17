```sql
-- Convert ids to base 36
SELECT
    id,
    CASE
        WHEN id = 0 THEN '0'
        ELSE
            ltrim(
                substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 / 36 / 36 % 36) + 1), 1) ||
                substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 / 36 % 36) + 1), 1) ||
                substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 % 36) + 1), 1) ||
                substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 % 36) + 1), 1) ||
                substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id % 36) + 1), 1),
                '0'
            )
    END AS id_base36
FROM table_name
WHERE 1=1;
```

```sql
-- Convert into a list as a string
SELECT
    STRING_AGG(
        '''' ||
        CASE
            WHEN id = 0 THEN '0'
            ELSE
                ltrim(
                    substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 / 36 / 36 % 36) + 1), 1) ||
                    substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 / 36 % 36) + 1), 1) ||
                    substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 / 36 % 36) + 1), 1) ||
                    substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id / 36 % 36) + 1), 1) ||
                    substr('0123456789abcdefghijklmnopqrstuvwxyz', ((id % 36) + 1), 1),
                    '0'
                )
        END || '''',
        ','
    ) AS id_base36_combined
FROM table_name
WHERE 1=1;
```

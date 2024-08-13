# Aggregate

## `string_agg`

```sql
SELECT string_agg(t.id::text, ', ' ORDER BY t.id) AS ids FROM data t
	JOIN data_theme_link ttl ON ttl.data_id = t.id
	WHERE t.data_context_id = 13
	AND ttl.data_theme_id = 208
	GROUP BY ttl.data_theme_id
;
```

## `array_to_string`

```sql
SELECT array_to_string(array_agg(t.id ORDER BY t.id), ', ') AS ids
FROM data t
JOIN data_theme_link ttl ON ttl.data_id = t.id
WHERE t.data_context_id = 13
AND ttl.data_theme_id = 208
GROUP BY ttl.data_theme_id
;
```

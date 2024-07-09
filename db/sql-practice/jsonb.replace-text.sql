UPDATE table_a
SET c1 = jsonb_set(
    c1,
    '{text, 0}',
    to_jsonb(replace(info -> 'text' ->> 0, ' $21.49 ', ' A$21.49 '))
)
WHERE 1=1
;

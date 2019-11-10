UPDATE my_table m
JOIN (
    SELECT 1 as id, 10 as _col1, 20 as _col2
    UNION ALL
    SELECT 2, 5, 10
    UNION ALL
    SELECT 3, 15, 30
) vals ON m.id = vals.id
SET col1 = _col1, col2 = _col2;
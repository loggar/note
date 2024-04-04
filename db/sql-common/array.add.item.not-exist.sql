UPDATE table_1
SET column_1 =
    CASE
        WHEN NOT 'new_value' = ANY(column_1) 
        THEN array_append(column_1, 'new_value') 
        ELSE column_1 
    END
WHERE condition_1 = 'condition_value';
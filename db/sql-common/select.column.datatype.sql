SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'table_1' AND column_name = 'column_1';
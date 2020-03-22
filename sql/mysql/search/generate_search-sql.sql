SELECT CONCAT('SELECT ', QUOTE(db), ',', QUOTE(tb), ',', QUOTE(col), ',COUNT(1) FieldHasIt FROM ', db, '.', tb, ' WHERE \`', col, '\`=''', SearchString, ''';') SearchSQL
FROM (
	SELECT table_schema db, table_name tb, column_name col
	FROM information_schema.columns
	WHERE table_schema = 'KOI_SIMS_TEST'
	AND (column_type LIKE 'char(%' OR column_type LIKE 'varchar(%' OR column_type LIKE '%text')
) A, (
	SELECT '098239M' SearchString
) B;

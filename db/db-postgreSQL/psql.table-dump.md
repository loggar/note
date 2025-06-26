# PostgreSQL Table Dump

## Basic Table Dump

### Dump Single Table (Structure and Data)
```bash
# Dump a single table with structure and data
pg_dump -U username -h hostname -d database_name -t table_name > table_dump.sql

# Example
pg_dump -U postgres -h localhost -d mydb -t users > users_dump.sql
```

### Dump Multiple Tables
```bash
# Dump multiple specific tables
pg_dump -U username -d database_name -t table1 -t table2 -t table3 > multiple_tables.sql

# Example
pg_dump -U postgres -d mydb -t users -t orders -t products > multiple_tables.sql
```

## Structure Only (Schema)

### Dump Table Structure Only
```bash
# Schema only (no data)
pg_dump -U username -d database_name -t table_name --schema-only > table_schema.sql

# Example
pg_dump -U postgres -d mydb -t users --schema-only > users_schema.sql
```

## Data Only

### Dump Table Data Only
```bash
# Data only (no structure)
pg_dump -U username -d database_name -t table_name --data-only > table_data.sql

# Example
pg_dump -U postgres -d mydb -t users --data-only > users_data.sql
```

### Data Only as INSERT Statements
```bash
# Data as INSERT statements (better for small tables)
pg_dump -U username -d database_name -t table_name --data-only --inserts > table_inserts.sql

# Example
pg_dump -U postgres -d mydb -t users --data-only --inserts > users_inserts.sql
```

## Advanced Options

### Dump with Compression
```bash
# Compress the dump (gzip)
pg_dump -U username -d database_name -t table_name | gzip > table_dump.sql.gz

# Custom format (compressed by default)
pg_dump -U username -d database_name -t table_name -Fc > table_dump.dump
```

### Dump Specific Columns
```bash
# Note: pg_dump doesn't support column-level dumps directly
# Use psql with COPY command instead:
psql -U username -d database_name -c "\COPY (SELECT col1, col2 FROM table_name) TO 'table_partial.csv' WITH CSV HEADER"
```

### Dump with WHERE Condition
```bash
# Dump table with WHERE condition
psql -U username -d database_name -c "\COPY (SELECT * FROM table_name WHERE condition) TO 'filtered_data.csv' WITH CSV HEADER"

# Example
psql -U postgres -d mydb -c "\COPY (SELECT * FROM users WHERE created_at > '2024-01-01') TO 'recent_users.csv' WITH CSV HEADER"
```

## Different Output Formats

### CSV Format
```bash
# Export table to CSV
psql -U username -d database_name -c "\COPY table_name TO 'table_export.csv' WITH CSV HEADER"

# Example
psql -U postgres -d mydb -c "\COPY users TO 'users.csv' WITH CSV HEADER"
```

### TSV Format
```bash
# Export table to Tab-separated values
psql -U username -d database_name -c "\COPY table_name TO 'table_export.tsv' WITH DELIMITER E'\t' CSV HEADER"
```

### JSON Format (PostgreSQL 9.2+)
```bash
# Export table as JSON
psql -U username -d database_name -c "\COPY (SELECT row_to_json(t) FROM (SELECT * FROM table_name) t) TO 'table_export.json'"
```

## Restore Table Dumps

### Restore SQL Dump
```bash
# Restore from SQL dump
psql -U username -d database_name < table_dump.sql

# Example
psql -U postgres -d mydb < users_dump.sql
```

### Restore Custom Format
```bash
# Restore from custom format dump
pg_restore -U username -d database_name table_dump.dump

# Restore specific table from custom format
pg_restore -U username -d database_name -t table_name database_dump.dump
```

### Restore CSV
```bash
# Import CSV back to table
psql -U username -d database_name -c "\COPY table_name FROM 'table_export.csv' WITH CSV HEADER"
```

## Practical Examples

### Backup Production Table for Testing
```bash
# Create a backup of production table
pg_dump -U prod_user -h prod-server -d prod_db -t important_table > prod_table_backup.sql

# Restore to test database
psql -U test_user -h test-server -d test_db < prod_table_backup.sql
```

### Migrate Table Between Databases
```bash
# Dump from source
pg_dump -U user1 -h server1 -d db1 -t table_name > table_migration.sql

# Restore to target
psql -U user2 -h server2 -d db2 < table_migration.sql
```

### Partial Data Export for Analysis
```bash
# Export recent data for analysis
psql -U username -d database_name -c "\COPY (SELECT * FROM transactions WHERE date >= '2024-01-01') TO 'recent_transactions.csv' WITH CSV HEADER"
```

## Common Options

- `-U, --username`: Database username
- `-h, --host`: Database host
- `-p, --port`: Database port (default: 5432)
- `-d, --dbname`: Database name
- `-t, --table`: Table name to dump
- `-f, --file`: Output file
- `-v, --verbose`: Verbose output
- `-Fc`: Custom format (compressed)
- `-Ft`: Tar format
- `-Fp`: Plain text format (default)
- `--schema-only`: Dump only schema
- `--data-only`: Dump only data
- `--inserts`: Use INSERT statements instead of COPY
- `--no-owner`: Skip ownership commands
- `--no-privileges`: Skip privilege commands

## Tips

1. **Always test restores** on a non-production environment first
2. **Use custom format** (`-Fc`) for large tables - it's compressed and faster
3. **Include timestamps** in backup filenames: `table_$(date +%Y%m%d_%H%M%S).sql`
4. **Check table dependencies** before dumping individual tables
5. **Use `--verbose`** to monitor progress on large dumps
6. **Consider `--jobs`** parameter for parallel processing with custom format dumps

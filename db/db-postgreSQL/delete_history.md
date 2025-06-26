# PostgreSQL Delete History

## Problem
PostgreSQL doesn't have built-in delete history tracking. Once a row is deleted, it's gone unless you implement one of the following solutions.

## Solution 1: Audit Table with Triggers

### Create Audit Table
```sql
-- Create audit table to store deletion history
CREATE TABLE user_delete_history (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255),
    deleted_data JSONB,
    deleted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_by VARCHAR(255)
);
```

### Create Trigger Function
```sql
-- Create trigger function to log deletions
CREATE OR REPLACE FUNCTION log_user_deletion()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO user_delete_history (user_id, deleted_data, deleted_by)
    VALUES (
        OLD.user_id,
        row_to_json(OLD)::jsonb,
        current_user
    );
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;
```

### Create Trigger
```sql
-- Create trigger on your main table
CREATE TRIGGER user_delete_trigger
    BEFORE DELETE ON your_table_name
    FOR EACH ROW
    EXECUTE FUNCTION log_user_deletion();
```

### Query Delete History
```sql
-- See delete history for user_id 'abc'
SELECT 
    id,
    user_id,
    deleted_data,
    deleted_at,
    deleted_by
FROM user_delete_history 
WHERE user_id = 'abc'
ORDER BY deleted_at DESC;

-- See specific fields from deleted data
SELECT 
    user_id,
    deleted_data->>'name' AS deleted_name,
    deleted_data->>'email' AS deleted_email,
    deleted_at,
    deleted_by
FROM user_delete_history 
WHERE user_id = 'abc'
ORDER BY deleted_at DESC;
```

## Solution 2: Soft Delete (Recommended)

### Add Soft Delete Columns
```sql
-- Add soft delete columns to existing table
ALTER TABLE your_table_name 
ADD COLUMN deleted_at TIMESTAMP NULL,
ADD COLUMN deleted_by VARCHAR(255) NULL,
ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;

-- Create index for performance
CREATE INDEX idx_table_deleted ON your_table_name (is_deleted, deleted_at);
```

### Soft Delete Function
```sql
-- Create soft delete function
CREATE OR REPLACE FUNCTION soft_delete_user(p_user_id VARCHAR(255))
RETURNS BOOLEAN AS $$
BEGIN
    UPDATE your_table_name 
    SET 
        is_deleted = TRUE,
        deleted_at = CURRENT_TIMESTAMP,
        deleted_by = current_user
    WHERE user_id = p_user_id AND is_deleted = FALSE;
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;
```

### Query Soft Deleted Records
```sql
-- See deleted records for user_id 'abc'
SELECT *
FROM your_table_name 
WHERE user_id = 'abc' AND is_deleted = TRUE
ORDER BY deleted_at DESC;

-- See all records (active and deleted) for user_id 'abc'
SELECT 
    *,
    CASE 
        WHEN is_deleted THEN 'DELETED'
        ELSE 'ACTIVE'
    END AS status
FROM your_table_name 
WHERE user_id = 'abc'
ORDER BY 
    is_deleted ASC, 
    COALESCE(deleted_at, created_at) DESC;
```

### Views for Clean Queries
```sql
-- Create view for active records only
CREATE VIEW active_users AS
SELECT * FROM your_table_name 
WHERE is_deleted = FALSE OR is_deleted IS NULL;

-- Create view for deleted records only
CREATE VIEW deleted_users AS
SELECT * FROM your_table_name 
WHERE is_deleted = TRUE;
```

## Solution 3: Using PostgreSQL WAL (Write-Ahead Logging)

### Enable WAL Logging
```sql
-- Check current WAL level
SHOW wal_level;

-- Enable logical replication (requires restart)
-- Add to postgresql.conf:
-- wal_level = logical
-- max_replication_slots = 4
-- max_wal_senders = 4
```

### Create Logical Replication Slot
```sql
-- Create replication slot
SELECT pg_create_logical_replication_slot('deletion_slot', 'test_decoding');

-- Read changes (including deletes)
SELECT * FROM pg_logical_slot_get_changes('deletion_slot', NULL, NULL);
```

## Solution 4: Event Sourcing Pattern

### Create Events Table
```sql
-- Create events table for all user actions
CREATE TABLE user_events (
    id SERIAL PRIMARY KEY,
    user_id VARCHAR(255),
    event_type VARCHAR(50), -- 'CREATED', 'UPDATED', 'DELETED'
    event_data JSONB,
    event_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    performed_by VARCHAR(255)
);

-- Index for performance
CREATE INDEX idx_user_events_user_id ON user_events (user_id, event_timestamp);
CREATE INDEX idx_user_events_type ON user_events (event_type, event_timestamp);
```

### Log Delete Events
```sql
-- Function to log delete event
CREATE OR REPLACE FUNCTION log_delete_event(p_user_id VARCHAR(255), p_deleted_data JSONB)
RETURNS VOID AS $$
BEGIN
    INSERT INTO user_events (user_id, event_type, event_data, performed_by)
    VALUES (p_user_id, 'DELETED', p_deleted_data, current_user);
END;
$$ LANGUAGE plpgsql;

-- Use in application code before deleting
SELECT log_delete_event('abc', '{"name": "John Doe", "email": "john@example.com"}'::jsonb);
DELETE FROM your_table_name WHERE user_id = 'abc';
```

### Query Delete Events
```sql
-- See all delete events for user_id 'abc'
SELECT 
    user_id,
    event_data,
    event_timestamp,
    performed_by
FROM user_events 
WHERE user_id = 'abc' AND event_type = 'DELETED'
ORDER BY event_timestamp DESC;

-- See complete history for user_id 'abc'
SELECT 
    user_id,
    event_type,
    event_data,
    event_timestamp,
    performed_by
FROM user_events 
WHERE user_id = 'abc'
ORDER BY event_timestamp DESC;
```

## Practical Examples

### Example 1: Check if User Was Ever Deleted (Soft Delete)
```sql
SELECT 
    user_id,
    CASE 
        WHEN is_deleted THEN 'Currently Deleted'
        WHEN deleted_at IS NOT NULL THEN 'Was Deleted, Now Restored'
        ELSE 'Never Deleted'
    END AS deletion_status,
    deleted_at,
    deleted_by
FROM your_table_name 
WHERE user_id = 'abc';
```

### Example 2: Restore Soft Deleted User
```sql
-- Restore soft deleted user
UPDATE your_table_name 
SET 
    is_deleted = FALSE,
    deleted_at = NULL,
    deleted_by = NULL
WHERE user_id = 'abc' AND is_deleted = TRUE;
```

### Example 3: Permanent Delete with History
```sql
-- Move to archive before permanent delete
INSERT INTO user_archive 
SELECT *, CURRENT_TIMESTAMP as archived_at 
FROM your_table_name 
WHERE user_id = 'abc';

-- Then permanently delete
DELETE FROM your_table_name WHERE user_id = 'abc';
```

### Example 4: Bulk Delete History Query
```sql
-- Find all users deleted in the last 30 days
SELECT 
    user_id,
    deleted_data->>'name' AS name,
    deleted_data->>'email' AS email,
    deleted_at,
    deleted_by
FROM user_delete_history 
WHERE deleted_at >= CURRENT_DATE - INTERVAL '30 days'
ORDER BY deleted_at DESC;
```

## Best Practices

1. **Use Soft Delete for User Data**: Easier to recover and audit
2. **Archive Old Deleted Records**: Move old soft-deleted records to archive tables
3. **Index Deletion Columns**: Always index `is_deleted` and `deleted_at` columns
4. **Set Retention Policies**: Define how long to keep deletion history
5. **Monitor Storage**: Audit tables can grow large, implement cleanup strategies
6. **Use Transactions**: Ensure deletion logging happens atomically with the delete

## Performance Considerations

```sql
-- Partition audit table by date for better performance
CREATE TABLE user_delete_history_2024 PARTITION OF user_delete_history
FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Create partial index for active records only
CREATE INDEX idx_active_users ON your_table_name (user_id) 
WHERE is_deleted = FALSE OR is_deleted IS NULL;
```

Choose the solution that best fits your needs:
- **Audit Table + Triggers**: Good for compliance and detailed tracking
- **Soft Delete**: Best for most applications, easy to implement and query
- **WAL**: Advanced option for complete change tracking
- **Event Sourcing**: Best for complex business logic and complete audit trails

## What If You Don't Have Audit Tables? (Checking Already Deleted Rows)

If you don't have audit tables or soft delete implemented, here are your options to find already deleted data:

### Option 1: Check PostgreSQL WAL Files (If Available)

```sql
-- Check if WAL archiving is enabled
SHOW archive_mode;
SHOW archive_command;

-- Check current WAL level
SHOW wal_level;

-- If wal_level is 'replica' or 'logical', you might be able to see recent changes
-- Check available WAL files
SELECT name, size, modification 
FROM pg_ls_waldir() 
ORDER BY modification DESC;
```

### Option 2: Use pg_waldump (Command Line Tool)

```bash
# Find WAL files (requires superuser access to PostgreSQL data directory)
# Usually located in: /var/lib/postgresql/data/pg_wal/

# Dump WAL file contents to see recent transactions
pg_waldump /path/to/wal/file | grep -i delete

# Example:
pg_waldump 000000010000000000000001 | grep -E "(DELETE|your_table_name)"

# Filter by specific table
pg_waldump 000000010000000000000001 --table=your_table_name
```

### Option 3: Check Application Logs

```bash
# Search application logs for delete operations
grep -i "delete.*user_id.*abc" /path/to/application.log

# Search database logs (if query logging is enabled)
grep -i "delete from your_table" /var/log/postgresql/postgresql.log
```

### Option 4: Database Backups

```sql
-- If you have recent backups, restore to a temporary database
-- and check if the deleted data exists there

-- Create temporary database from backup
createdb temp_restore_db

-- Restore backup (adjust command based on your backup format)
pg_restore -d temp_restore_db your_backup_file.dump

-- Or from SQL dump:
psql temp_restore_db < your_backup_file.sql

-- Check for the deleted data
psql temp_restore_db -c "SELECT * FROM your_table_name WHERE user_id = 'abc';"

-- Don't forget to drop temp database when done
dropdb temp_restore_db
```

### Option 5: Check Related Tables

```sql
-- Look for references in other tables that might indicate the data existed
-- For example, if you have orders table that references users:

SELECT DISTINCT user_id 
FROM orders 
WHERE user_id = 'abc';

-- Check foreign key relationships
SELECT 
    tc.constraint_name,
    tc.table_name,
    kcu.column_name,
    ccu.table_name AS foreign_table_name,
    ccu.column_name AS foreign_column_name
FROM information_schema.table_constraints AS tc
JOIN information_schema.key_column_usage AS kcu
    ON tc.constraint_name = kcu.constraint_name
JOIN information_schema.constraint_column_usage AS ccu
    ON ccu.constraint_name = tc.constraint_name
WHERE tc.constraint_type = 'FOREIGN KEY'
    AND (ccu.table_name = 'your_table_name' OR tc.table_name = 'your_table_name');

-- Then check those related tables for traces of user_id 'abc'
```

### Option 6: Check PostgreSQL System Catalogs

```sql
-- Check if there are any remaining references in system catalogs
-- (This is unlikely to help with data, but might show schema changes)

-- Check recent database activity (if pg_stat_statements is enabled)
SELECT query, calls, total_time, mean_time
FROM pg_stat_statements 
WHERE query ILIKE '%delete%' 
    AND query ILIKE '%your_table_name%'
ORDER BY last_exec DESC;
```

### Option 7: Physical File Recovery (Advanced)

```bash
# If the deletion was very recent, you might try file-level recovery
# This requires stopping PostgreSQL and is very risky

# 1. Stop PostgreSQL service
sudo systemctl stop postgresql

# 2. Use file recovery tools on the database files
# WARNING: This should only be done by experts and with full backups

# 3. Tools like photorec or extundelete might help recover deleted blocks
# But this is extremely difficult and usually not practical
```

### Most Practical Solutions:

1. **Check your most recent backup** and see if the deleted data exists there
2. **Search application/database logs** for delete operations
3. **Look in related tables** for foreign key references
4. **Check WAL files** if you have access and they contain recent enough data

### Prevention for Future:

```sql
-- Implement soft delete going forward
ALTER TABLE your_table_name 
ADD COLUMN deleted_at TIMESTAMP NULL,
ADD COLUMN deleted_by VARCHAR(255) NULL,
ADD COLUMN is_deleted BOOLEAN DEFAULT FALSE;

-- Create function for safe delete
CREATE OR REPLACE FUNCTION safe_delete_user(p_user_id VARCHAR(255))
RETURNS BOOLEAN AS $$
BEGIN
    UPDATE your_table_name 
    SET 
        is_deleted = TRUE,
        deleted_at = CURRENT_TIMESTAMP,
        deleted_by = current_user
    WHERE user_id = p_user_id AND (is_deleted = FALSE OR is_deleted IS NULL);
    
    RETURN FOUND;
END;
$$ LANGUAGE plpgsql;

-- Use this instead of DELETE
SELECT safe_delete_user('abc');
```

### Reality Check:

Unfortunately, if none of the above options work, the deleted data is likely permanently lost. PostgreSQL's MVCC system eventually reclaims space from deleted rows through VACUUM operations, making recovery impossible without proper audit trails or backups.

**Key Takeaway**: Always implement audit logging or soft deletes BEFORE you need them!
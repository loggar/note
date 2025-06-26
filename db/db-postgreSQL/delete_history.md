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
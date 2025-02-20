# EXCLUDED

EXCLUDED is a special table reference in PostgreSQL that's used in ON CONFLICT clauses. It refers to the row that would have been inserted if there wasn't a conflict.

Let's break it down with an example:

```sql
INSERT INTO users (id, name, email, updated_at)
VALUES (1, 'John', 'john@email.com', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO UPDATE
SET
    name = EXCLUDED.name,        -- 'John'
    email = EXCLUDED.email,      -- 'john@email.com'
    updated_at = EXCLUDED.updated_at  -- CURRENT_TIMESTAMP
```

In this case:

1. If there's no conflict (no existing row with id=1):
   - The row is simply inserted
2. If there is a conflict (existing row with id=1):
   - EXCLUDED.name refers to 'John' (the value we tried to insert)
   - EXCLUDED.email refers to 'john@email.com' (the value we tried to insert)
   - NOT the values in the existing row

You can also use EXCLUDED to make conditional updates:

```sql
INSERT INTO users (id, name, last_login)
VALUES (1, 'John', CURRENT_TIMESTAMP)
ON CONFLICT (id) DO UPDATE
SET
    name = CASE
        WHEN users.name IS NULL THEN EXCLUDED.name  -- Only update if current name is NULL
        ELSE users.name  -- Keep existing name
    END,
    last_login = EXCLUDED.last_login  -- Always update last_login
```

Here, `users` refers to the existing row in the table, while `EXCLUDED` refers to the new row that would have been inserted.

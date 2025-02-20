WITH upsert_a AS (
    INSERT INTO table_a (
        id, 
        name, 
        status, 
        created_at
    )
    VALUES (
        1,
        'Example Name',
        'active',
        CURRENT_TIMESTAMP
    )
    ON CONFLICT (id) DO UPDATE 
    SET 
        name = EXCLUDED.name,
        status = EXCLUDED.status,
        updated_at = CURRENT_TIMESTAMP
    RETURNING 
        id,
        name,
        xmax = 0 as is_insert,    -- true if inserted, false if updated
        TRUE as is_successful     -- will always be true if row was affected
)
INSERT INTO table_b (
    table_a_id,
    description,
    quantity,
    created_at
)
SELECT 
    upsert_a.id,
    'Related description',
    100,
    CURRENT_TIMESTAMP
FROM upsert_a
WHERE upsert_a.is_successful = TRUE    -- only proceed if table_a upsert was successful
ON CONFLICT (table_a_id) DO UPDATE 
SET 
    description = EXCLUDED.description,
    quantity = EXCLUDED.quantity,
    updated_at = CURRENT_TIMESTAMP;
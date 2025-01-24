# Get next id

```sql
-- Function to get next label_id for a member
CREATE OR REPLACE FUNCTION get_next_custom_label_id(p_member_id varchar)
RETURNS INT AS $$
DECLARE
    next_id INT;
BEGIN
    -- Get the current max label_id for this member
    SELECT COALESCE(MAX(label_id), 0) + 1
    INTO next_id
    FROM public.custom_label
    WHERE member_id = p_member_id;

    RETURN next_id;
END;
$$ LANGUAGE plpgsql;
```

```sql
-- Example insert using the function:
INSERT INTO public.custom_label (member_id, label_id, label_name)
SELECT
    'id1',
    get_next_custom_label_id('id1'),
    'Label A';
```

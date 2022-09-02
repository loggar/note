-- Checks if a record exists or not in the subquery, and returns true if one or more results are found.
SELECT
    employee_id,
    contact_number
FROM
    employee
WHERE
    EXISTS (
        SELECT
            employee_id,
            department
        FROM
            department
        WHERE
            employee_id = 345
            AND department = 'HR'
    );
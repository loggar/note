-- Logical operator used with SELECT, WHERE and HAVING, and returns true if all the values satisfy the subquery condition
SELECT
    employee_name,
    joining_date
from
    employee
WHERE
    employee_id = ALL (
        select
            employee_id
        from
            department_details
        WHERE
            department = 'R&D'
    );
-- Logical operator; returns true if even one of the subquery values satisfies the condition in where clause
SELECT
    employee_id,
    employee_name
from
    employee
WHERE
    employee_id = ANY (
        select
            employee_id
        from
            department_details
        WHERE
            department = 'HR'
            OR department
    )
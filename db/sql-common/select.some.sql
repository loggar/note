-- Returns true if one of the conditions in the subquery is satisfied. SOME is similar to the ANY command
SELECT
    employee_id,
    employee_name
from
    employee
WHERE
    salary > SOME (
        select
            salary
        from
            employee
        WHERE
            department = 'HR'
    );
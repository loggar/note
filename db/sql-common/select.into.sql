-- Copies data from the source table into another destination table. You can select all the columns (*) or specific columns.
SELECT
    * INTO new_employee_info
FROM
    employee;

SELECT
    employee_name,
    joining_date,
    core_skill INTO new_employee_info
FROM
    employee;
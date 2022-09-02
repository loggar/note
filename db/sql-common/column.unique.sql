-- Adds a unique constraint to the specified column, meaning that the column cannot have duplicate values. Can be used during table create or alter commands.
CREATE TABLE employee (employee_id int NOT NULL, UNIQUE(employee_id));

ALTER TABLE
    employee
ADD
    UNIQUE(employee_id);
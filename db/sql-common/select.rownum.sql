-- Returns the specified number of rows mentioned in the WHERE clause of the query
SELECT
    *
from
    employee
where
    ROWNUM <= 5;

This will return the first five rows in the resultset.
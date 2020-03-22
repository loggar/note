-- a string is null or empty

SELECT IF(field1 IS NULL or field1 = '', 'empty', field1) as field1 
from tablename
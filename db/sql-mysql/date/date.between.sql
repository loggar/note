SELECT DISTINCT EMPNAME
FROM EMPLOYEES
WHERE DOB  BETWEEN STR_TO_DATE( '27/08/2000', '%d/%m/%Y') AND STR_TO_DATE( '27/08/2010', '%d/%m/%Y')
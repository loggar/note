/*
You have a composite index of three columns, and you only provide the value of two columns in WHERE clause of a select query?
Will Index be used for this operation? For example if Index is on EmpId, EmpFirstName, and EmpSecondName and you write query like

SELECT * FROM Employee WHERE EmpId=2 and EmpFirstName='Radhe'
*/

/* ANSWER:
If the given two columns are secondary index column then the index will not invoke,
but if the given 2 columns contain the primary index(first column while creating index)
then the index will invoke. In this case, Index will be used because EmpId and EmpFirstName are primary columns.
*/
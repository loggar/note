/*
The HAVING clause was added to SQL because the WHERE keyword could not be used with aggregate functions.

The following SQL statement lists the number of customers in each country, sorted high to low (Only include countries with more than 5 customers):
*/

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;

/* // result:

COUNT(CustomerID)	Country
13	USA
11	France
11	Germany
9	Brazil
7	UK
*/
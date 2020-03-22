 SELECT id
 	, subject
	, GROUP_CONCAT(username SEPARATOR ', ') usernames
FROM some_table
WHERE 1=1
GROUP BY id, subject
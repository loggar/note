-- Mysql error: Illegal mix of collations for operation 'UNION'
-- caused by mixed data-encoding

SELECT 
   comment
FROM comments
UNION
SELECT 
   comment
FROM videos



SELECT 
   comment COLLATE utf8_general_ci
FROM comments
UNION
SELECT 
   comment
FROM videos
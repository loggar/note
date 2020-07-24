CREATE FUNCTION simplefunc (s CHAR(20)) RETURNS CHAR(50) DETERMINISTIC
RETURN CONCAT('Hello, ', s, '!');


-- usage 
-- SELECT simplefunc('world');
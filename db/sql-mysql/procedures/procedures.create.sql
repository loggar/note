CREATE PROCEDURE `simpleproc`(OUT `Param1` INT)
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT ''
BEGIN
	SELECT COUNT(*) INTO param1 FROM tutors;
END


-- usage
-- CALL simpleproc(@a);
-- SELECT @a;
BEGIN
	DECLARE done INT DEFAULT FALSE;
	DECLARE vTableName VARCHAR(100);
	
	DECLARE cursor1 CURSOR FOR
		SELECT TABLE_NAME FROM INFORMATION_SCHEMA.COLUMNS
		WHERE table_schema = v_db_name
		AND column_name = 'DEL_FLAG';
	
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	CREATE TEMPORARY TABLE IF NOT EXISTS tempTable
	(
		vTableName varchar(255),
		DEL_FLAG varchar(255)
	);
		
	OPEN cursor1;
	read_loop:LOOP
		FETCH cursor1 INTO vTableName;
		IF done THEN LEAVE read_loop;
		END IF;

		PREPARE STMT from CONCAT('INSERT INTO tempTable SELECT \'', vTableName, '\', DEL_FLAG FROM ', vTableName,' ', 'WHERE DEL_FLAG NOT IN (\'N\', \'Y\')');    	
		EXECUTE STMT;
		DEALLOCATE PREPARE STMT;
		
	END LOOP;
	CLOSE cursor1;
	SELECT * FROM tempTable;
	DROP TEMPORARY TABLE tempTable;
END
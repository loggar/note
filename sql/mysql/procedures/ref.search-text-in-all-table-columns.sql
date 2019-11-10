CREATE DEFINER=`root`@`%` PROCEDURE `getSearchedStringInAllTableColumns`(IN `tableSchemaText` VARCHAR(50), IN `conditionQuery` VARCHAR(256))
	LANGUAGE SQL
	NOT DETERMINISTIC
	CONTAINS SQL
	SQL SECURITY DEFINER
	COMMENT 'Usage CALL getSearchedStringInAllTableColumns(\'TEST_DB\', "= \'Charly\'");'
BEGIN

-- variables
SET @table_schema = tableSchemaText;
SET @condition_query = conditionQuery;
SET @column_types_regexp = '^((var)?char|(var)?binary|blob|text|enum|set)\\(';

-- Reset @sql_query in case it was used previously
SET @sql_query = '';

SELECT
    -- Use `DISTINCT IF(QUERYBUILDING, NULL, NULL)` to only select a single null value instead of selecting the query over and over again as it's built
    DISTINCT IF(@sql_query := CONCAT(
        IF(LENGTH(@sql_query), CONCAT(@sql_query, " UNION "), ""),
        'SELECT ',
            QUOTE(CONCAT('`', `table_name`, '`.`', `column_name`, '`')), ' AS `column`, ',
            'COUNT(*) AS `occurrences` ',
        'FROM `', `table_schema`, '`.`', `table_name`, '` ',
        'WHERE `', `column_name`, '` ', @condition_query
    ), NULL, NULL) `query`
FROM (
    SELECT
        `table_schema`,
        `table_name`,
        `column_name`
    FROM `information_schema`.`columns`
    WHERE `table_schema` = @table_schema
    AND `column_type` REGEXP @column_types_regexp
) `results`;

select @sql_query;

SET @sql_query = CONCAT("SELECT * FROM (", @sql_query, ") `results` WHERE `occurrences` > 0");

PREPARE statement FROM @sql_query;
EXECUTE statement;
DEALLOCATE PREPARE statement;

END
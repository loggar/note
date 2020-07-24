UPDATE table_name
SET col_a = (@tmp := col_a),
    col_a = col_b, 
    col_b = @tmp
WHERE 1=1
AND (	IFNULL(col_a, '') = 'Y'
	OR IFNULL(col_b, '') = 'Y'	
)

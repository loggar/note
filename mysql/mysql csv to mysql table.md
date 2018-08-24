```sql
LOAD DATA LOCAL INFILE  
'c:/temp/some-file.csv'
INTO TABLE your_awesome_table  
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(field_1,field_2, field_3);
```
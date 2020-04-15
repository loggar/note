# issues

## import routines functions procedures

```
ERROR 1418 (HY000): This function has none of DETERMINISTIC, NO SQL,
or READS SQL DATA in its declaration and binary logging is enabled
(you *might* want to use the less safe log_bin_trust_function_creators
variable)
```

By default, for a CREATE FUNCTION statement to be accepted, at least one of DETERMINISTIC, NO SQL, or READS SQL DATA must be specified explicitly. Otherwise an error occurs:

```
CREATE FUNCTION f1(i INT)
RETURNS INT
DETERMINISTIC  -- specified explicitly
READS SQL DATA
BEGIN
  RETURN i;
END;
```

```
CREATE EVENT, CREATE PROCEDURE, CREATE FUNCTION, ALTER EVENT, ALTER PROCEDURE, ALTER FUNCTION, DROP EVENT, DROP PROCEDURE, and DROP FUNCTION statements
```

If you want to change the default setting for this:

```
mysql> SET GLOBAL log_bin_trust_function_creators = 1;
```

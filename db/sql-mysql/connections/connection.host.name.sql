SELECT VARIABLE_VALUE /* INTO @local_hostname */
FROM INFORMATION_SCHEMA.GLOBAL_VARIABLES
WHERE VARIABLE_NAME = 'HOSTNAME';
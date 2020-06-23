# version compatibility

## `only_full_group_by`

The error:

```
which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by

```

It turned out that the `only_full_group_by` mode was made default in version `5.7.5`., which breaks many of such naive queries.

Rewrite all queries to be 5.7 compatible, or update the sql_mode removing `ONLY_FULL_GROUP_BY`.

Show `SQL_MODE`

```
SHOW VARIABLES LIKE 'SQL_MODE';

sql_mode ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION


```

Delete the setting `ONLY_FULL_GROUP_BY`

```
-- session
SET @@SQL_MODE='STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- global
SET GLOBAL sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

```

### Permanently Change SQL Mode in MySQL

Where mysqld:

```
$ which mysqld
/usr/sbin/mysqld
```

Where the favored configuration files:

```
$ /usr/sbin/mysqld --verbose --help | grep -A 1 "Default options"

Default options are read from the following files in the given order:
/etc/my.cnf /etc/mysql/my.cnf ~/.my.cnf
```

Edit `/etc/mysql/my.cnf`

```
[mysqld]
# ... other stuff will probably be here
sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION'
```

Restart the mysql server, or the docker container.

# mysql version

terminal:

```sh
$ mysqld --version
mysqld  Ver 5.7.11 for Win64 on x86_64 (MySQL Community Server (GPL))

$ mysqladmin -V
mysqladmin  Ver 8.42 Distrib 5.7.11, for Win64 on x86_64
```

sql:

```sql
SHOW VARIABLES LIKE "%version%";

SELECT VERSION();

STATUS;
```

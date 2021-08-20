```
[local]
root/admin
```

```
Create a file -  C:\_dev\mysql\mysql-5.7.11-winx64\my.ini
Create a file -  C:\_dev\mysql\mysql-8.0.26-winx64\my.ini

(Run this once after locate mysql - console demon initialize)
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --initialize --console
C:\_dev\mysql\mysql-8.0.26-winx64\bin\mysqld --initialize --console

```

[mysql console] - works like demon/service

```
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --console
C:\_dev\mysql\mysql-8.0.26-winx64\bin\mysqld --console
```

Start server with init file (process it once when you reset the root password):

`init/my-init.sql`

```
ALTER USER 'root'@'localhost' IDENTIFIED BY 'mypass';
FLUSH PRIVILEGES;
```

```
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --console --init-file=C:\_dev\mysql\mysql-5.7.11-winx64\init\my-init.sql

C:\_dev\mysql\mysql-8.0.26-winx64\bin\mysqld --console --init-file=C:\_dev\mysql\mysql-8.0.26-winx64\init\my-init.sql
```

[root pwd]

```
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'mypass'; FLUSH PRIVILEGES;
// or
mysql> set password = password('mypass');
```

[mysql client]

```
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysql -u root -p
C:\_dev\mysql\mysql-8.0.26-winx64\bin\mysql -u root -p
Enter password: *****
```

```
[local]
root/admin
```

```
Create a file -  C:\_dev\mysql\mysql-5.7.11-winx64\my.ini

(Run this once after locate mysql - console demon initialize)
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --initialize --console

[alter temporary pwd - register new pwd in order to gain authorities.(run this once)]
ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin'; FLUSH PRIVILEGES;
// or
mysql> set password = password('admin');
```

```
[mysql console] - works like demon/service
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --console

[mysql client]
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysql -u root -p
Enter password: ************
```

Mysql MariaDB Server Status

1. To Start MySQL/MariaDB server

```
# For Sysvinit Systems #
# service mysql start
or
# /etc/init.d/mysql start

# For Systemd Systems #
# systemctl start mariadb.service
or
# systemctl start mysql.service
or
# systemctl start mariadb
or
# systemctl start mysql
```

2. To Stop MySQL/MariaDB server

```
# For Sysvinit Systems #
# service mysql stop
or
# /etc/init.d/mysql stop

# For Systemd Systems #
# systemctl stop mariadb.service
or
# systemctl stop mysql.service
or
# systemctl stop mariadb
or
# systemctl stop mysql
```

3. To Restart MySQL/MariaDB server

```
# For Sysvinit Systems #
# service mysql restart
or
# /etc/init.d/mysql restart

# For Systemd Systems #
# systemctl restart mariadb.service
or
# systemctl restart mysql.service
or
# systemctl restart mariadb
or
# systemctl restart mysql
```

4. To Reload MySQL/MariaDB server

```
# For Sysvinit Systems #
# service mysql reload
or
# /etc/init.d/mysql reload

# For Systemd Systems #
# systemctl reload mariadb.service
or
# systemctl reload mysql.service
or
# systemctl reload mariadb
or
# systemctl reload mysql
```

5. To view status of MySQL/MariaDB server

```
# For Sysvinit Systems #
# service mysql status
or
# /etc/init.d/mysql status

# For Systemd Systems #
# systemctl status mariadb.service
or
# systemctl status mysql.service
or
# systemctl status mariadb
or
# systemctl status mysql
```

6. To Enable MySQL/MariaDB server in boot

```
# For Sysvinit Systems #
# chkconfig mysqld on

# For Systemd Systems #
# systemctl enable mariadb.service
or
# systemctl enable mysql.service
or
# systemctl enable mariadb
or
# systemctl enable mysql
```

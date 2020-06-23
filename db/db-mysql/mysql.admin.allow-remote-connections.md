# How to Allow Remote Connections to MySQL Database Server

## Configuring MySQL Server

Search for a line that begins with `bind-address` and set its value to the IP address on which a MySQL server should listen.

By default, the value is set to `127.0.0.1` (listens only in localhost).

In this example, we’ll set the MySQL server to listen on all IPv4 interfaces by changing the value to `0.0.0.0`.

If there is a line containing skip-networking, delete it or comment it out by adding # at the beginning of the line.

`/etc/mysql/mysql.conf.d/mysqld.cnf`

```
[mysqld]
bind-address           = 0.0.0.0
# skip-networking
```

```
# Debian, Ubuntu
$ sudo systemctl restart mysql

# RedHat, Centos
$ sudo systemctl restart mysqld
```

## Granting Access to a User from a Remote Machine

```
sudo mysql
```

If you are using the old, native MySQL authentication plugin to log in as root run the command below and enter the password when prompted:

```
mysql -uroot -p
```

From inside the MySQL shell, use the GRANT statement to grant access for the remote user.

```
# GRANT ALL ON database_name.* TO user_name@'ip_address' IDENTIFIED BY 'user_password';

GRANT ALL ON dbname.* TO foo@'10.8.0.5' IDENTIFIED BY 'my_passwd';
```

## Configuring Firewall

### iptables

If you are using `iptables` as your firewall, the command bellow will allow access from any IP address on the Internet to the MySQL port.

```
sudo iptables -A INPUT -p tcp --destination-port 3306 -j ACCEPT
```

Allow access from a specific IP address:

```
sudo iptables -A INPUT -s 10.8.0.5 -p tcp --destination-port 3306 -j ACCEPT
```

### UFW

`UFW` is the default firewall tool in Ubuntu. To allow access from any IP address on the Internet (very insecure) run:

```
sudo ufw allow 3306/tcp
```

Allow access from a specific IP address:

```
sudo ufw allow from 10.8.0.5 to any port 3306
```

### FirewallD

`FirewallD` is the default firewall management tool in CentOS. To allow access from any IP address on the Internet (very insecure) type:

```
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload
```

To allow access from a specific IP address on a specific port, you can either create a new FirewallD zone or use a rich rule. Well create a new zone named mysqlzone:

```
sudo firewall-cmd --new-zone=mysqlzone --permanent
sudo firewall-cmd --reload
sudo firewall-cmd --permanent --zone=mysqlzone --add-source=10.8.0.5/32
sudo firewall-cmd --permanent --zone=mysqlzone --add-port=3306/tcp
sudo firewall-cmd --reload
```

## Verifying the Changes

```
mysql -u user_name -h mysql_server_ip -p
```

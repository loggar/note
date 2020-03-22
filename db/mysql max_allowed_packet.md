# How to allow bigger max_allowed_packet

MySQL Error 1153 - Got a packet bigger than 'max_allowed_packet' bytes

1. mysql command line: 

```
mysql --max_allowed_packet=100M -u root -p database < dump.sql
```

2. `/etc/my.cnf`

```
[mysqld]
# added to avoid err "Got a packet bigger than 'max_allowed_packet' bytes"
#
net_buffer_length=1000000 
max_allowed_packet=33554432
#
```

3. `my.ini`

```
set-variable = max_allowed_packet = 32M
```

or 

```
set-variable = max_allowed_packet = 33554432
```

Then restart the server:

```
/etc/init.d/mysql restart
```

4. mysql client command

```
Select @@global.max_allowed_packet;

SET GLOBAL max_allowed_packet=33554432;

Select @@global.max_allowed_packet;
```
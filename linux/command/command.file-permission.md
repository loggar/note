## file permissions

```
r - read, w - write, x - execute
u - user, g - group, o - other, a - all

0 - no permission
1 - execute
2 - write
3 - execute + write
4 - read
5 - read + execute
6 - read + write
7 - all
```

```
chmod 777 ex.txt => gives all permissions to all users, groups and others.

'+' - gives permission
'-' - removes permission
'=' - assigns the given permission

chmod u=rw ex.txt => gives read/write to user
chmod a= ex.txt => removes all permission to all users.

chgrp {group name} {filename} => changes group for a file
chown {user} {filename} => changes owner of a file
```

### Change file mode executable:

```
chmod +x /root/mysql/shell-script/*.sh
```

### chown – change file owner and group.

```
chown [OPTIONS] [USER][:GROUP] file[s]
```

```
$ chown -v SetUser:SetGroup /var/www/html/webfile
```

### chroot – run command or interactive shell with a special root directory.

```
chroot /home/guest/jail
```

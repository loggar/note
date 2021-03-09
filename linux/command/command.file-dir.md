## files and directories

```
ls => list all files
ls -a => list all files along with hidden ones
ls -R => list all files and folders recursively
ls -l => list in long format (shows more info)

rm {filename} => deletes a file

mv {filename} {directory path} => moves a file

mv {srcFileName} {destFileName} => renames a file

cp {srcFileName} {destFileName} => copies file

cp -R {srcDir} {destDir} => copies directory

cat {filename} => read contents of a file

cat > {filename} => writes to file

touch {filename} => creates a file, touch is basically used to change file timestamps. Refer here

mkdir {directory name} => makes a directory

rmdir {directory name} => removes a directory

rm -rf {directory name} => removes a directory recursively along with the files

mv {dirname1} {path or dirname} => moves or renames directory

history => list all commands used in the current session

clear => clears the terminal screen

pwd => displays the path of the current working directory.
```

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
## files and directories

goto home dir:

```
cd ~
```

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

### df: The df command shows the size, used space, and available space on the mounted filesystems of your computer.

```
df -h -x squashfs
```

### find

```
find . -name *ones*
```

```
find . -type f -name *ones*
```

Case-Insensitive:

```
find . -iname *wild*
```

# Linux User Add

```
useradd username
```

Create a User with Specific User ID

```
useradd -u 999 username

cat /etc/passwd | grep username
```

Change password

```
passwd username
```

Create a User with Specific Group ID

```
useradd -u 1000 -g 500 username

cat /etc/passwd | grep username
```

Add a User to Multiple Groups

```
useradd -G admins,webadmin,developers username

id username
```

Add a User without Home Directory

```
useradd -M username
```

Create a User with Account Expiry Date

```
useradd -e 2014-03-27 username

chage -l aparna
```

Create a User with Password Expiry Date (ex 45 days)

```
useradd -e 2014-04-27 -f 45 username
```

Add a User with Custom Comments

```
useradd -c "Comment" username

tail -1 /etc/passwd
```

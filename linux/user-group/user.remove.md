# Delete a User on Linux

## Process

Check the Login

```
who
```

Reviewing The User’s Processes

```
ps -u eric
```

`top` also has an `-U` (user) option to restrict the output to the processes owned by a single user. Note that this time it is an uppercase `U`.

```
top -U eric
```

Locking the Account

```
sudo awk -F: '/eric/ {print $1,$2}' /etc/shadow
```

To lock the account we use the `passwd` command. We'll use the `-l` (lock) option and pass in the name of the user account to lock.

```
sudo passwd -l eric
```

Killing the Processes

```
sudo pkill -KILL -u eric
```

Check the user again

```
who
```

## Home dir

Archiving the User’s home Directory

Options:

- c: Create an archive file.
- f: Use the specified filename for the name of the archive.
- j: Use bzip2 compression.
- v: Provide verbose output as the archive is created.

```
sudo tar cfjv eric-20200820.tar.bz /home/eric
```

Check the archived file

```
ls -lh eric-20200802.tar.bz
```

## Cron jobs

Cron Jobs

```
sudo ls -lh /var/spool/cron/crontabs/eric
```

Removing cron Jobs

```
sudo crontab -r -u eric
```

## Print jobs

```
lprm -U eric
```

## Deleting the User Account

Check the commands:

```
type deluser
type userdel
```

```
sudo deluser --remove-home eric
```

The command to use for non-Debian distributions is `userdel`, with the `--remove` flag:

```
sudo userdel --remove eric
```

Check the removing jobs:

```
ls /home
```

```
sudo less /etc/group | grep eric
```

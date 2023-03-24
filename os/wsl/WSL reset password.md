# wsl distro, user password

## Reset forgotten password for Ubuntu or any other Linux distribution on WSL

Switch the default user to root from the host:

```sh
ubuntu config --default-user root # ubuntu

ubuntu2004 config --default-user root # ubuntu 20.04

ubuntu2804 config --default-user root # ubuntu 18.04

debian config –default-user root # debian

kali config –default-user root # kali linux
```

Reset the password for the account in the wsl console:

```sh
passwd username
```

Switch back the default user to the normal user

```sh
ubuntu config --default-user username
```

## reset password using root user connection

```
# host
> wsl --list
> wsl -d <distro> -u root

# distro
$ passwd <user>
```

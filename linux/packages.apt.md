# apt

How to Install/Uninstall Programs from your Ubuntu System

## update apt

```
sudo apt update

sudo apt install software-properties-common apt-transport-https wget
```

## install packages

list installed packages

```
dpkg --list

dpkg --list | grep git
```

### Install Software Using Dpkg Command

```
sudo dpkg -i teamviewer_amd64.deb
```

If you get any dependency errors while installing or after installing and launching a program, you can use the following apt command to resolve and install dependencies using the -f flag, which tells the program to fix broken dependencies.

```
sudo apt-get install -f
```

To remove a package use `-r` option or if you want to remove all its files including configuration files, you can purge it using the `--purge` option as shown.

```
$ sudo dpkg -r teamviewer       [Remove Package]
$ sudo dpkg --purge teamviewer  [Remove Package with Configuration Files]
```

### Install Software Using Apt Command

The apt command is a advanced command-line tool, which offers new software package installation, existing software package upgradation, updating of the package list index, and even upgrading the whole Ubuntu or Linux Mint system.

It also offers apt-get and apt-cache command-line tools for managing packages more interactively on Debian and its derivatives such as Ubuntu and Linux Mint systems.

Essentially, apt-get or apt do not understand `.deb` files, they are designed to primarily handle package names (for example teamviewer, apache2, mariadb etc..) and they retrieve and install `.deb` archives associated with a package name, from a source specified in the `/etc/apt/sources.list` file.

The only trick to installing a local Debian package using apt-get or apt is by specifying a local relative or absolute path (`./` if in current dir) to the package, otherwise it will try to retrieve the package from remote sources and the operation will fail.

```
$ sudo apt install ./teamviewer_amd64.deb
$ sudo apt-get install ./teamviewer_amd64.deb
```

## Uninstall Applications

The following command will list all the packages installed on your system:

```
dpkg --list

dpkg --list | grep package-name
```

### Use apt-get remove command

The apt-get remove command removes a software from your system but keeps the configuration files and any plugins and settings that you might have installed later. This helps in keeping the same settings when you want to reinstall the software.

Run the following command as sudo in order to remove a software;

```
sudo apt-get remove package-name
```

### Use apt-get purge command

If you want to remove an application completely from your system, also removing any personalized settings, it is best to use the apt-get purge command.

In this example, I will be removing the OpenJDK package named “openjdk-11-jdk:amd64” from my system.

Run the following command as sudo in order to remove a software;

```
sudo apt-get purge code
```

### Clean the Mess with autoremove

In case you want to remove any dependencies such as the applications and libraries used by the software you once installed that is no longer in use, you can do some housekeeping through the following command:

```
sudo apt-get autoremove
```

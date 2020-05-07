# Uninstall JDK

This tutorial is written to help New Linux Users, who want to uninstall Java Development Kit (JDK) installed on their Linux. The tasks performed on `Ubuntu 16.04`, but this will also work on other Debian Based Linux like Linux Mint, Kali Linux, etc.

So, first of all, check the vendor of the JDK you have installed on your system, whether it is `Oracle JDK` or `Openjdk`. For that execute the following command in the terminal:

```
$ java -version
```

If you have `Oracle JDK` installed then you will get the following result:

```
$ java -version
java version "1.8.0_112"
Java(TM) SE Runtime Environment (build 1.8.0_112-b15)
Java HotSpot(TM) 64-Bit Server VM (build 25.112-b15, mixed mode)
Else if you have Openjdk installed then you will get the following result:
```

```
$ java -version
java version "1.7.0_91"
OpenJDK Runtime Environment (amzn-2.6.2.2.63.amzn1-x86_64 u91-b00)
OpenJDK 64-Bit Server VM (build 24.91-b01, mixed mode)
Now follow the instructions below according to the JDK you have installed.
```

## UNINSTALL ORACLE JDK

### Remove The Link

First of all remove the alternatives by executing the following commands:

```
$ sudo update-alternatives --remove "java" "/usr/lib/jvm/jdk[version]/bin/java"
$ sudo update-alternatives --remove "javac" "/usr/lib/jvm/jdk[version]/bin/javac"
$ sudo update-alternatives --remove "javaws" "/usr/lib/jvm/jdk[version]/jre/bin/javaws"
Note: Replace the [version] with any version number that’s contained in jdk folder’s name. For example: jdk1.8.0_131.
```

### Remove The Package

After removing link, remove the package inside /usr/lib/jvm/jdk[version] by executing following command:

```
$ sudo rm -r /usr/lib/jvm/jdk[version]
```

## UNINSTALL OPENJDK

If you want to remove Openjdk only, execute the following command on terminal:

```
$ sudo apt-get remove openjdk*
```

If you want to remove Openjdk along with dependencies, execute the following command on terminal:

```
$ sudo apt-get remove --auto-remove openjdk*
```

If you want to remove Openjdk and it’s configuration files, execute the following command on terminal:

```
$ sudo apt-get purge openjdk*
```

If you want to remove Openjdk along with dependencies and it’s configuration files, execute the following command on terminal:

```
$ sudo apt-get purge --auto-remove openjdk*
```

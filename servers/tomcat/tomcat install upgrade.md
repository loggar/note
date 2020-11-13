# tomcat install / upgrade

## download and install (Centos)

```
cd /tmp

wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.zip
# wget https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.42/bin/apache-tomcat-8.0.42.zip

unzip apache-tomcat-*.zip
```

```
sudo mkdir -p /opt/tomcat
sudo mv apache-tomcat-8.5.37 /opt/tomcat/
```

Tomcat 8.5 is updated frequently. To have more control over versions and updates, we will create a symbolic link latest which will point to the Tomcat installation directory:

```
sudo ln -s /opt/tomcat/apache-tomcat-8.5.37 /opt/tomcat/latest
```

The tomcat user that we previously set up needs to have access to the tomcat directory.
Change the directory ownership to user and group tomcat:

```
sudo chown -R tomcat: /opt/tomcat
```

Make the scripts inside bin directory executable by issuing the following chmod command:

```
sudo sh -c 'chmod +x /opt/tomcat/latest/bin/*.sh'
```

## tomcat upgrade minor version

```
1) Back up your current Tomcat directory -- just in case
2) Download and extract the new version to a local directory
3) Stop Tomcat
4) Replace the files in /old-tomcat/lib with files from /new-tomcat/lib (`cp /tmp/apache-tomcat-8.0.42/lib/*.* ./`)
5) Copy extended lib (ex. `javamelody.jar`)
6) Start Tomcat
```

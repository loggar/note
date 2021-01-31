# tomcat 9 centos

```
wget https://downloads.apache.org/tomcat/tomcat-9/v9.0.41/bin/apache-tomcat-9.0.41.tar.gz -P /tmp && \
    sudo tar xf /tmp/apache-tomcat-9.0.41.tar.gz -C /opt
```

`env`

```
JAVA_HOME=/opt/jdk1.8.0_40
CATALINA_HOME=/opt/apache-tomcat-9.0.41
```

set `apache-tomcat-9.0.41/conf`

```
server.xml
tomcat-user.xml
```

```
cd apache-tomcat-9.0.41/bin

# load env

sudo ./startup.sh
```
# Install java

## centos

### Latest maven (3.6)

```
# yum install wget
```

```
# wget https://downloads.apache.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz -P /tmp
```

```
# sudo tar xf /tmp/apache-maven-3.6.3-bin.tar.gz -C /opt
# sudo ln -s /opt/apache-maven-3.6.3 /opt/maven
```

### maven release

```
# sudo yum install maven

# mvn --version

Apache Maven 3.0.5 (Red Hat 3.0.5-17)
Maven home: /usr/share/maven
Java version: 1.8.0_242, vendor: Oracle Corporation
Java home: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.19.76-linuxkit", arch: "amd64", family: "unix"
```

### setting env

`.bash_profile`

```
# User specific environment and startup programs

PATH=$PATH:$HOME/bin

export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64
export M2_HOME=/opt/maven
export MAVEN_HOME=/opt/maven

export PATH=${PATH}:${M2_HOME}/bin
```

```
# source /root/.bash_profile

# mvn --version
Apache Maven 3.6.3 (cecedd343002696d0abb50b32b541b8a6ba2883f)
Maven home: /opt/maven
Java version: 1.8.0_242, vendor: Oracle Corporation, runtime: /usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64/jre
Default locale: en_US, platform encoding: ANSI_X3.4-1968
OS name: "linux", version: "4.19.76-linuxkit", arch: "amd64", family: "unix"
```

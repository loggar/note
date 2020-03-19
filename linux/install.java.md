# Install java

## centos

```
# sudo yum install java-1.8.0-openjdk

# or OpenJDK 8 JDK

# sudo yum install java-1.8.0-openjdk-devel

# java -version

```

Select current java:

```
# update-alternatives --config java
```

`.bash_profile`

```
# User specific environment and startup programs

PATH=$PATH:$HOME/bin
JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64

export PATH
export JAVA_HOME
```

```
# source .bash_profile

# echo $JAVA_HOME
/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.242.b08-0.el7_7.x86_64
```

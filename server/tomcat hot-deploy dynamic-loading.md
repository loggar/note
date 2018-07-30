# Tomcat debugging - hot deploy, dynamic loading

## install

mvn repository

```
<!-- https://mvnrepository.com/artifact/org.springframework/springloaded -->
<dependency>
	<groupId>org.springframework</groupId>
	<artifactId>springloaded</artifactId>
	<version>1.2.8.RELEASE</version>
	<scope>provided</scope>
</dependency>
```

locate the lib

```
C:\_dev\eclipse\eclipse_ext_lib\springloaded\1.2.8.RELEASE\springloaded-1.2.8.RELEASE.jar
```

## apply to eclipse

Server View - Generated Tomcat Server (Select) - General Infomation - Open Launch Configuration

or 

Project Root Context Menu - Debug as - Debug Configurations - Apache Tomcat

> Arguments Tab - VM arguments : add above argument

```
-javaagent:C:\dir\springloaded-1.2.8.RELEASE.jar -noverify 
```


Server View - Generated Tomcat Server (Select) - Publishing

```
check Automatically Publish when resources change
```


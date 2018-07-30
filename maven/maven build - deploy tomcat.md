
> CATALINA/conf/tomcat-users.xml

```
<!-- add manage role -->
<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="xxxxxx" roles="manager-gui "/>
<user username="admin_deploy" password="xxxxxx" roles="manager-gui, manager-jmx, manager-status, manager-script, "/>
```


> CATALINA/conf/server.xml

```
<!-- host -->
<Host name="HOST_NAME" appBase="/DIR_HOST" unpackWARs="true" autoDeploy="true">
	<!-- Access log processes all example. Documentation at: /docs/config/valve.html Note: The pattern used is equivalent to using pattern="common" -->
	<Valve className="org.apache.catalina.valves.AccessLogValve" directory="logs" prefix="test_access" suffix=".log" pattern="%h %l %u %t &quot;%r&quot; %s %b" />
	<Context docBase="/picture" path="/picture" reloadable="true" />
	<Context docBase="/upload" path="/upload" reloadable="true" />
	<Context docBase="/report" path="/report" reloadable="true" />
</Host>
```

> copy manage app to the host dir

```
[/DIR_HOST/manager]
catalina_home/webapps/manager application context copy
```


Restart Tomcat


> maven pom.xml

```
<plugin>
	<groupId>org.apache.tomcat.maven</groupId>
	<artifactId>tomcat7-maven-plugin</artifactId>
	<version>2.2</version>
	<configuration>
		<url>http://HOST_NAME/manager/text</url>
		<path>/</path>
		<username>admin_deploy</username>
		<password>xxxxxx</password>
	</configuration>
</plugin>
```


> maven - build - goals

```
war:inplace tomcat7:redeploy
```

# tomcat host name and alias

`server.xml`

```xml
<Engine defaultHost="techdirectarchive.com" name="Catalina">
	<Host name="a" appBase="/home/user1/a">
		<Alias>www.aaa.com</Alias>
		<Context path="" docBase="." />
	</Host>
	<Host name="b" appBase="/home/user1/b">
		<Alias>www.bbb.com</Alias>
		<Context path="" docBase="." />
	</Host>
	<Host name="c" appBase="/home/user1/c">
		<Alias>www.ccc.com</Alias>
		<Context path="" docBase="." />
	</Host>
</Engine>
```

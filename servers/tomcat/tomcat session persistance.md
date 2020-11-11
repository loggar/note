# tomcat session persistance

`webroot/META-INF/context.xml`

```
<Context path="" docBase="/path/to/ROOT" reloadable="true">
	<Manager path="" className="org.apache.catalina.session.PersistentManager" saveOnRestart="true">
		<Store className="org.apache.catalina.session.FileStore" directory="/path/to/project/sessions" />
	</Manager>
</Context>
```

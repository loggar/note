# tomcat skip load jar

`META-INF/context.xml`

```xml
<?xml version="1.0" encoding="UTF-8"?>
<Context> <!-- web application will be reloaded. -->
	<WatchedResource>WEB-INF/web.xml</WatchedResource>

	<JarScanner>
		<JarScanFilter pluggabilitySkip="${tomcat.util.scan.StandardJarScanFilter.jarsToSkip}, bcprov-jdk15on-1.62.jar, bcpkix-jdk15on-1.62.jar" />
	</JarScanner>
</Context>
```

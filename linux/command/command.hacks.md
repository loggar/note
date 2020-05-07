# linux command, hacks

Run the previous command with sudo:

```
sudo !!
```

Multi-line command:

```
java ^
	-classpath ./target/classes;./target/test-classes;./webapp/WEB-INF/lib/*; ^
	com.koi.deploy.test.RunMavenBuild ^
	local all
```

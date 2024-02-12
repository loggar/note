# linux command, hacks

## Run the previous command with sudo:

```
sudo !!
```

## Multi-line command:

```
java ^
	-classpath ./target/classes;./target/test-classes;./webapp/WEB-INF/lib/*; ^
	com.koi.deploy.test.RunMavenBuild ^
	local all
```

## Agree for all query with linux commands

```
yes | yum install curl
```

## alias

```
$ alias pf="ps -e | grep $1"
```

```
$ pf java
```

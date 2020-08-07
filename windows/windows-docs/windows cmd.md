# windows cmd

## how to use 'spaces' in using path

```
"C:\Program Files\ab cd\xyz.exe"
```

## `where` command

with Windows cmd

```
$ where java.exe

C:\Program Files (x86)\Common Files\Oracle\Java\javapath\java.exe
C:\_dev\Java\jdk1.8.0_191\bin\java.exe
```

with Powershell

```
PS C:\> (get-command javac.exe).Path

C:\_dev\Java\jdk1.8.0_191\bin\javac.exe
```

## Multi-line command

```
java ^
	-classpath ./target/classes;./target/test-classes;./webapp/WEB-INF/lib/*; ^
	com.koi.deploy.test.RunMavenBuild ^
	local all
```

## Create a file

```
$ type nul > file1.txt
```

```
$ echo some text > file3.txt
```

appending text to a file

```
$ echo some text >> file3.txt
```

## Create a directory

```
$ mkdir dirname
```

## Delete a file

```
$ del hello.txt
```

## Delete a directory

```
$ rmdir /s dirname

$ rmdir /s "if have spaces"
```

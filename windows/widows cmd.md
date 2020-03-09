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

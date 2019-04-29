# windows env variables

## cmd

exporting

```
$ SET >> window-user-system-variables.txt
```

show

```
$ env

$ set

$ echo %GOPATH%

$ echo %PATH%
```

set

```
set PATH=%PATH%;C:/newPath
```

```
set PY_ENV=development

echo %PY_ENV%
```

unset

```
set VAR_NAME=
```

## powershell

```
$Env:<variable-name>
```

```
$Env:<variable-name> += "<new-value>"

$Env:path += ";c:\temp"

Set-Item -Path Env:Path -Value ($Env:Path + ";C:\Temp")
```

```
$env:PY_ENV = "development"

$Env:PY_ENV
```

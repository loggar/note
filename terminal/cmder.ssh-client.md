# cmder: SSH Client

> Cmder Settings - Startup - Tasks

Group:

```
ssh::root@10.1.20.30
```

Task parameters:

```
 /icon "%CMDER_ROOT%\icons\cmder.ico"
```

Commands:

```
cmd /c "%ConEmuDir%\..\git-for-windows\usr\bin\ssh root@10.1.20.30 -new_console:d:%USERPROFILE% "-new_console:t:10.1.20.30"
```

# cmder

Console emulator for Windows based on ConEmu

## Change "λ" to "\$"

```
~cmder\vendor, open clink.lua, line 44, change to (lambda = "$")
```

## cmder: Docker Terminal

> Cmder Settings - Startup - Tasks

Group:

```
docker
```

Task parameters:

```
/dir "%DOCKER_TOOLBOX_INSTALL_PATH%" /icon "%DOCKER_TOOLBOX_INSTALL_PATH%\docker.exe"
```

Commands:

```
C:\_dev\git\bin\bash.exe -l -i "%DOCKER_TOOLBOX_INSTALL_PATH%\start.sh" -new_console:t:"Docker"
```

## cmder: SSH Client

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

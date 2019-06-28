# cmder: Docker Terminal

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
bash.exe-l -i "%DOCKER_TOOLBOX_INSTALL_PATH%\start.sh" -new_console:t:"Docker"
```

# vscode wsl2

Issue on connection Alpine distro from vscode:

```
[2023-03-24 22:41:24.939] Setting up server environment: Looking for /home/loggar/.vscode-server/server-env-setup. Not found.
[2023-03-24 22:41:24.939] WSL version: 5.10.16.3-microsoft-standard-WSL2 Alpine
[2023-03-24 22:41:24.940] WARNING: Ignoring https://dl-cdn.alpinelinux.org/alpine/v3.17/main: No such file or directory
[2023-03-24 22:41:24.940] WARNING: Ignoring https://dl-cdn.alpinelinux.org/alpine/v3.17/community: No such file or directory
[2023-03-24 22:41:24.940] libstdc++ is required to run the VSCode Server:
[2023-03-24 22:41:24.940] Please open an Alpine shell and run 'apk update && apk add libstdc++'
[2023-03-24 22:41:24.941] VS Code Server for WSL closed unexpectedly.
[2023-03-24 22:41:24.941] For help with startup problems, go to https://code.visualstudio.com/docs/remote/troubleshooting#_wsl-tips
[2023-03-24 22:41:24.961] WSL Daemon exited with code 0
[2023-03-24 22:41:49.473] Download in background is enabled
```

Resolution:

```
# wsl terminal
$ apk update
$ apk add libstdc++
```
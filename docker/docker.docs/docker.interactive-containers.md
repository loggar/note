# Interactive Containers

## Autoremove Interactive Containers

```
$ docker run -it --rm alpine sh
```

## nsenter : Get a shell on the host temporarily

```
$ docker run --privileged --pid=host -it alpine:3.8 \
nsenter -t 1 -m -u -n -i sh
```

- `--rm` : removes the container after it is stopped
- `-ti` (or `-t -i`) : adds a tty and leaves the standard input opened
- `--privileged` : grants additional permissions to the container, it allows the container to gain access to the devices of the host (`/dev`)
- `--pid=host` : allows the containers to use the processus tree of the Docker host (the VM in which the Docker daemon is running)

```
$ docker run alpine:3.8 nsenter --help
BusyBox v1.28.4 (2018–07–17 15:21:40 UTC) multi-call binary.
Usage: nsenter [OPTIONS] [PROG [ARGS]]
-t PID Target process to get namespaces from
-m[FILE] Enter mount namespace
-u[FILE] Enter UTS namespace (hostname etc)
-i[FILE] Enter System V IPC namespace
-n[FILE] Enter network namespace
-p[FILE] Enter pid namespace
-U[FILE] Enter user namespace
-S UID Set uid in entered namespace
-G GID Set gid in entered namespace
—-preserve-credentials Don’t touch uids or gids
-r[DIR] Set root directory
-w[DIR] Set working directory
-F Don’t fork before exec’ing PROG
```

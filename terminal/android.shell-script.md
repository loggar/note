# Shell script on android

linux bash:
```sh
#!/bin/bash
```

android shell:
```sh
#!/system/bin/sh
```

example:
```sh
#!/system/bin/sh
# usage: kill_prc.sh mediaserver
ps | busybox grep $1 | busybox awk '{print $2}' | busybox xargs kill -9
```

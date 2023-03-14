# code-server, android

using `termux`

## install

```
pkg install nodejs

pkg install yarn

pkg install build-essential

pkg install python

pkg install git
```

```
yarn global add code-server
```

```
cat ~/.config/code-server/config.yaml
```

## running server

```
code-server &
```

open code-server client

```
127.0.0.1:8080
```

## shutting down server

kill background code-server process

```
sudo pkill code-server
```

```
ps -eaf

sudo kill -9 3905
```

```
$ pgrep code-server

$ sudo kill -9 733
```

```
$ jobs
[1]-  Running                 code-server &

$ kill %1
```

## update code-server

```
pkg update

yarn global remove code-server

yarn global add code-server
```

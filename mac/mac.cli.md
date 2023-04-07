# cli

## common

```
cancel current command line while writing: ctrl + g
```

## port

list currently being used ports:

```
sudo lsof -i -n -P | grep TCP
sudo lsof -i -n -P | grep TCP | grep 59871
sudo lsof -i -n -P | grep TCP | grep 8681
```

kill a process with port number

```
lsof -t -i :60544

kill -9 <PID>
```

## env

```sh
# remove env var
$ unset ENV_VAR_1
# set env empty
$ export ENV_VAR_1=

# restore env var
$ export ENV_VAR_1=value
```

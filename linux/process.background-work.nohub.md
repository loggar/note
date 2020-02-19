# nohub

```
test.sh &
```

This work terminated when user disconnect their terminal session.

```
nohup ./test.sh &
```

This work does not terminated.

Terminate the nohub works:

```
ps -ef

kill [pid of test.sh]
```

Log file

```
./nohup.out
```

Run a long-lasting process in the background and close the terminal

```
nohup wget http://large-files.com/10gb-super-movie.avi &
```

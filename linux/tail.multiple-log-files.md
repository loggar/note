# Methods To View tail -f output of Multiple Log Files in One Terminal

* https://www.thegeekstuff.com/2009/09/multitail-to-view-tail-f-output-of-multiple-log-files-in-one-terminal/

## Method 1: Use Custom Shell Script (with Unix tail command)

```sh
$ vi multi-tail.sh
#!/bin/sh

# When this exits, exit all back ground process also.
trap 'kill $(jobs -p)' EXIT

# iterate through the each given file names,
for file in "$@"
do
	# show tails of each in background.
	tail -f $file &
done

# wait .. until CTRL+C
wait
```

```
$ ./multi-tail.sh error_log access_log
```

## Method 2: Using the standard Linux tail command

```
$ tail -f /var/log/syslog -f /var/log/auth.log
```

## Method 3. Use multitail command on Debian flavor of Linux

```
$ apt-get install multitail
```

```
$ multitail /var/log/syslog /var/log/auth.log
```

# Use the timeout Command on Linux

Using timeout With Other Time Units

```
$ timeout 5 ping google.com.au

# time-unit s(default), m, h, d

$ timeout 3m ping 192.168.4.28
```

Limiting Data Capture With timeout

```
# network traffic capture tool

$ sudo pacman -Syu tcpdump

$ timeout 10 sudo tcpdump > capture.txt

$ ls -lh capture.txt
```

Sending The Right Signal

```
$ timeout -s SIGKILL 10 sudo tcpdump > capture.txt

$ timeout -s SIGKILL 1m sudo tcpdump > capture.txt
```

Asking Politely First

We can ask timeout to try to stop the program using SIGTERM, and to only send in SIGKILL if SIGTERM didn’t work.

To do this, we use the -k (kill after) option. The -k option requires a time value as a parameter.

In this command, we’re asking timeout to let dmesg run for 30 seconds, and to then terminate it with the SIGTERM signal. If dmesg is still running after 40 seconds, it means the diplomatic SIGTERM was ignored and timeout should send in SIGKILL to finish the job.

dmesg is a utility that can monitor the kernel ring buffer messages and display them in a terminal window.

```
$ timeout -k 40 30 dmseg -w
```

Retrieving the Program’s Exit Code

```
$ timeout 5 ping Nostromo.local

# The command runs for five seconds and timeout terminates it. We can then check the exit code using this command:

$ echo $?

# To verify the exit code is coming from ping, let’s force ping to generate a different exit code. If we try to send ping requests to a non-existent IP address, ping will fail with an error exit code. We can then use echo to check that the exit code is non-zero.

$ timeout --preserve-status 1m ping -c 5 NotHere.local

$ echo $?
```

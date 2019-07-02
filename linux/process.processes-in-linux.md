# Processes in Linux

## Types of Processes

1. Foreground processes (interactive processes)
2. Background processes (non-interactive processes)

`Demons`: Special type of background processes that starts at system startup and keep running as a service. They are started as system tasks (run as services), spontaneously.

## Processes are Categorized into:

- Parent Processes: create other processes during run-time.
- Child Processes: are created by other processes during run-time.
- The Init Process: is the parent of all processes on the system, PID 1, PPID 0.

To find the process ID and PPID of the `current shell`, run:

```
echo $$

echo $PPID
```

## ps

list processes

```
ps -lA
```

This may be too many processes to read at one time, so you can pipe the output through the less command to scroll through them at your own pace:

```
ps -lA | less
```

Press `q` to exit less.

You could also pipe the output through grep to search for a specific process without using any other commands. The following command would search for the Firefox process:

```
ps -lA | grep ps
```

## pgrep

Given a search term, pgrep returns the process IDs that match it. For example, you could use the following command to find Firefox’s PID:

```
pgrep firefox
```

You can also combine this command with kill to kill a specific process. Using pkill or killall is simpler, though.

```
kill $(pgrep firefox)
```

## monitoring processes

The pstree command is another way of visualizing processes.

```
pstree
```

The top command is the traditional way to view your system’s resource usage and see the processes that are taking up the most system resources. Top displays a list of processes, with the ones using the most CPU at the top.

```
top
```

To exit top or top, use the Ctrl-C keyboard shortcut.

The htop command is an improved top. It’s not installed by default on most Linux distributions — here’s the command you’ll need to install it on Ubuntu:

```
sudo apt-get install htop

htop
```

## kill

The kill command can kill a process, given its process ID. You can get this information from the ps -A, top or pgrep commands.

```
ps -lA | grep firefox

kill -9 1234
```

The `pkill` and `killall` commands can kill a process, given its name. Use either command to kill Firefox:

```
pkill firefox

killall firefox
```

## renice

The renice command changes the nice value of an already running process. The nice value determines what priority the process runs with. A value of -19 is very high priority, while a value of 19 is very low priority. A value of 0 is the default priority.

The renice command requires a process’s PID. The following command makes a process run with very low priority:

```
renice 19 PID
```

You can use the pgrep trick above with renice, too.

If you’re making a process run at a higher priority, you’ll require root permissions. On Ubuntu, use sudo for that:

```
sudo renice -19 #
```

## Starting a Process

start a foreground process

```
$ npm start
```

To start a process in the background, use `&` symbol.

```
$ npm start &

^C

$ jobs
[1]+  Running                 npm start &
```

To send a background process to the foreground:

```
$ jobs
[1]+  Running                 npm start &

$ fg %1
```

## Sending signal to Processes

List All Linux Signals

```
loggar@DT-Charly:~/apps-node/docker-simple-ex-1$ kill -l
 1) SIGHUP       2) SIGINT       3) SIGQUIT      4) SIGILL       5) SIGTRAP
 6) SIGABRT      7) SIGBUS       8) SIGFPE       9) SIGKILL     10) SIGUSR1
11) SIGSEGV     12) SIGUSR2     13) SIGPIPE     14) SIGALRM     15) SIGTERM
16) SIGSTKFLT   17) SIGCHLD     18) SIGCONT     19) SIGSTOP     20) SIGTSTP
21) SIGTTIN     22) SIGTTOU     23) SIGURG      24) SIGXCPU     25) SIGXFSZ
26) SIGVTALRM   27) SIGPROF     28) SIGWINCH    29) SIGIO       30) SIGPWR
31) SIGSYS      34) SIGRTMIN    35) SIGRTMIN+1  36) SIGRTMIN+2  37) SIGRTMIN+3
38) SIGRTMIN+4  39) SIGRTMIN+5  40) SIGRTMIN+6  41) SIGRTMIN+7  42) SIGRTMIN+8
43) SIGRTMIN+9  44) SIGRTMIN+10 45) SIGRTMIN+11 46) SIGRTMIN+12 47) SIGRTMIN+13
48) SIGRTMIN+14 49) SIGRTMIN+15 50) SIGRTMAX-14 51) SIGRTMAX-13 52) SIGRTMAX-12
53) SIGRTMAX-11 54) SIGRTMAX-10 55) SIGRTMAX-9  56) SIGRTMAX-8  57) SIGRTMAX-7
58) SIGRTMAX-6  59) SIGRTMAX-5  60) SIGRTMAX-4  61) SIGRTMAX-3  62) SIGRTMAX-2
63) SIGRTMAX-1  64) SIGRTMAX
```

- SIGHUP (1) - Hangup detected on controlling terminal or death - of controlling process.
- SIGINT (2) - Interrupt from keyboard.
- SIGKILL (9) - Kill signal i.e. kill running process.
- SIGSTOP (19) - Stop process.
- SIGCONT (18) - Continue process if stopped.

Examples:

```
kill -9 1234
kill -KILL 1234
kill -SIGKILL 1234
```

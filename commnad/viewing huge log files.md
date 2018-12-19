# Examples for Viewing Huge Log Files in Unix

* https://www.thegeekstuff.com/2009/08/10-awesome-examples-for-viewing-huge-log-files-in-unix/

## Example 1: Display specific lines (based on line number) of a file using sed command

View only the specific lines mentioned by line numbers.

```
Syntax: $ sed -n -e Xp -e Yp FILENAME
```

* `sed` : sed command, which will print all the lines by default.
* `-n` : Suppresses output.
* `-e CMD` : Command to be executed
* `Xp` : Print line number X
* `Yp` : Print line number Y
* `FILENAME` : name of the file to be processed.


The example mentioned below will print the lines 120, 145, 1050 from the syslog.

```
$ sed -n -e 120p -e 145p -e 1050p /var/log/syslog
```

In the following example,  you can view the content of var/log/cron from line number 101 to 110.

* `M` – Starting line number
* `N` – Ending line number

```
Syntax: sed -n M,Np FILENAME

$ sed -n 101,110p /var/log/cron
```

## Example 2: Display first N lines of a file using head command

This example displays only first 15 lines of /var/log/maillog file. Change 15 to 10 to display the first 10 lines of a log file.

```
Syntax: head -n N FILENAME

$ head -n 15 /var/log/maillog
```

## Example 3: Ignore last N lines of a file using head command

This example shows how to ignore the last N lines, and show only the remaining lines from the top of file.

The following example will display all the lines of the /var/log/secure except the last 250 lines.

```
Syntax: head -n -N FILENAME

$ head -n -250 /var/log/secure
```

## Example 4: Display last N lines of the file using tail command

This example displays only last 50 lines of /var/log/messages file. Change 50 to 100 to display the last 100 lines of the log file.

```
Syntax: tail -n N FILENAME

$ tail -n 50 /var/log/messages
```

## Example 5: Ignore first N-1 lines of the file using tail command

This example shows how to ignore the first N-1 lines and show only the remaining of the lines.

The following example ignores the 1st four lines of the /etc/xinetd.conf, which contains only the comments.

```
Syntax: tail -n +N FILENAME

$ tail -n +5 /etc/xinetd.conf
defaults
{
        instances               = 60
        log_type                = SYSLOG authpriv
        log_on_success          = HOST PID
        log_on_failure          = HOST
        cps                     = 25 30
}
includedir /etc/xinetd.d
```

## Example 6: View growing log file in real time using tail command

This is probably one of the most used command by sysadmins.To view a growing log file and see only the newer contents use tail -f as shown below.

The following example shows the content of the /var/log/syslog command in real-time.

```
Syntax: tail -f FILENAME

$ tail -f /var/log/syslog
```

## Example 7: Display specific lines (based on line number) of a file using head and tail command

The example below will display line numbers 101 – 110 of /var/log/anaconda.log file

* `M` – Starting line number
* `N` – Ending line number

```
Syntax: cat file | tail -n +N | head -n (M-N+1)

$ cat /var/log/anaconda.log | tail -n +101 | head -n 10
```

* `cat` : prints the whole file to the stdout.
* `tail -n +101` : ignores lines upto the given line number, and then start printing lines after the given number.
* `head -n 10` : prints the first 10 line, that is 101 to 110 and ignores the remaining lines.

## Example 8: Display lines matching a pattern, and few lines following the match.

The following example displays the line that matches “Initializing CPU” from the /var/log/dmesg and 5 lines immediately after this match.

```
# grep "Initializing CPU#1" /var/log/dmesg
Initializing CPU#1
[Note: The above shows only the line matching the pattern]

# grep -A 5 "Initializing CPU#1" dmesg
Initializing CPU#1
Calibrating delay using timer specific routine.. 3989.96 BogoMIPS (lpj=1994982)
CPU: After generic identify, caps: bfebfbff 20100000 00000000 00000000
CPU: After vendor identify, caps:  bfebfbff 20100000 00000000 00000000
monitor/mwait feature present.
CPU: L1 I cache: 32K, L1 D cache: 32K
[Note: The above shows the line and 5 lines after the pattern matching]
```

* Viewing specific lines identified by patterns, which is grep’s default functionality.
* Viewing only the matched characters.
* Viewing N lines after the match with -A option.
* Viewing N lines before the match with -B option.
* Viewing N lines around the match with -C option.

## Example 9: Displaying specific bytes from a file.

The following example explains how to display either the top 40 or the last 30 bytes of a file.

Display first 40 bytes from syslog.

```
$ head -c40 /var/log/syslog
```

Display last 30 bytes from syslog.

```
$ tail -c30 /var/log/syslog
```

## Example 10: Viewing compressed log files

After a specific time all the system log files are rotated, and compressed. You can uncompress it on the fly, and pipe the output to another unix command to view the file as explained below.

Display the first N lines of a compressed file.
```
$ zcat file.gz | head -250
```

Display the last N lines of a compressed file.
```
$ zcat file.gz | tail -250
```

Ignoring the last N lines of a compressed file.
```
$ zcat file.gz | head -n -250
```

Ignoring the first N lines of a compressed file.
```
$ zcat file.gz | tail -n +250
```

Viewing the lines matching the pattern
```
$ zcat file.gz | grep -A2 'error'
```

Viewing particular range of lines identified by line number.
```
$ zcat file.gz | sed -n -e 45p -e 52p
```

Display the first N lines of a compressed file.
```
$ zcat file.gz | head -250
```
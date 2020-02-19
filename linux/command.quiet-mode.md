# Quiet mode

A lot of standards commands has quiet or silent mode. Very useful when you are creating some bash script. In most of the cases just add `-q` or `-s` (read `--help` or `man` or `check` on StackOverflow)

```
zip -q archive.zip big-file.jpg
```

But sometimes (practically always with in-house scripts) you have to ignore the output (send to `/dev/null`)

```
./very-verbose.sh 1>/dev/null
```

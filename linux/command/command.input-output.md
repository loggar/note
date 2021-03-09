## input/ output directions

```
'>' write (stdout)
Eg: ls -al > {filename} => writes the output of "ls -al" to the file. If the file already exists, it is overwritten.

'>>' append (stdout)
Eg: echo "hi" >> {filename} => appends to the file

'<' input

File descriptors : 0 - stdin, 1 - stdout, 2 - stderr
```

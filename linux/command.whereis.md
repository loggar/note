# whereis, dpkg

If you want to find the location of a program you can just use `whereis <program>`

In your case run:

```
whereis python2.7
whereis python3.2
```

For finding every file that apt-get has copied for installation use:

```
dpkg -S python2.7
dpkg -S python3.2
```

But maby it is recommend to save it in a textfile, because the output is to large.

```
dpkg -S python2.7 >log.txt
gedit log.txt
```

for running `.py` file with python 3.2

```
python3.2 <file.py>
```

# dos2unix

Convert text files with DOS or Mac line endings to Unix line endings and vice versa.

```
yum install dos2unix
```

## Converting

Convert from DOS default code page to Unix Latin-1:

```
dos2unix -iso -n in.txt out.txt
```

Convert from DOS CP850 to Unix Latin-1:

```
dos2unix -850 -n in.txt out.txt
```

Convert from Windows CP1252 to Unix Latin-1:

```
dos2unix -1252 -n in.txt out.txt
```

Convert from Windows CP1252 to Unix UTF-8 (Unicode):

```
iconv -f CP1252 -t UTF-8 in.txt | dos2unix > out.txt
```

Convert from Unix Latin-1 to DOS default code page:

```
unix2dos -iso -n in.txt out.txt
```

Convert from Unix Latin-1 to DOS CP850:

```
unix2dos -850 -n in.txt out.txt
```

Convert from Unix Latin-1 to Windows CP1252:

```
unix2dos -1252 -n in.txt out.txt
```

Convert from Unix UTF-8 (Unicode) to Windows CP1252:

```
unix2dos < in.txt | iconv -f UTF-8 -t CP1252 > out.txt
```

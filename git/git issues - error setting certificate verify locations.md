## error setting certificate verify locations

when clone or fetch, pull,

```
fatal: unable to access 'https://github.com/loggar/note.git/': error setting certificate verify locations:
  CAfile: C:/_dev/git/mingw64/libexec/ssl/certs/ca-bundle.crt
  CApath: none
```

find the existing ssl verifying file.

```
git config --system http.sslcainfo "C:\_dev\git\mingw64\ssl\certs\ca-bundle.crt"
```

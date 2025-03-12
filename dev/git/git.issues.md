# GIT Issues

## The current branch master has no upstream branch.

```
λ git push --set-upstream origin master

Fatal: HttpRequestException encountered.
Username for 'https://github.com': loggar
Password for 'https://loggar@github.com':
Branch master set up to track remote branch master from origin.
Everything up-to-date
```

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

## Please tell me who you are

```
to set your account's default identity.
Omit --global to set the identity only in this repository.

fatal: unable to auto-detect email address
```

```
git config --global user.email "charly.loggar@gmail.com"

git config --global user.name "Charly LEE"
```

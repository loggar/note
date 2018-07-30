### git-credential-store - Helper to store credentials on disk
```
$ git config credential.helper store
$ git push https://<username>:<password>@example.com/repo.git
```

or 

```
$ git config credential.helper store
$ git push http://example.com/repo.git
Username: <type your username>
Password: <type your password>
```

cancellation

```
git config --unset credential.helper
```

### config file

```
// .git/config    <- applied

url = https://username:password@repository-url.com
```

### config global

```
git config --global credential.https://github.com.username <your_username>
```

```
git config --global --edit
```

### git push, pull with username 
```
$ git push https://<username>:<password>@github.com/webnlog/ssomac.github.io
$ git pull https://<username>@github.com/webnlog/ssomac.github.io
```

```
$ git init
$ git remote add origin https://github.com/loggar/js.git
$ git pull origin master
```

```
$ git push https://<username>:<password>@github.com/loggar/py.git
```
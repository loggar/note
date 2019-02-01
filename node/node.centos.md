# Install NodeJS in CentOS

## Install NodeJS

Install git

```
$ yum install git
```

Download nvm

```
$ git clone git://github.com/creationix/nvm.git ~/.nvm
```

Run nvm

```
$ source /root/.nvm/nvm.sh
```

Install nodejs with specific version

```
$ nvm install v8.10.0

$ nvm ls
```

## reset envs when..

```
$ npm --version
bash: npm: command not found...
```

```
$ source /root/.nvm/nvm.sh

$ npm --version
6.1.0
```
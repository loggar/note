# npx

npm package runner

## Using locally-installed tools without npm run-script

```shell
$ npm i -D cowsay

$ npx cowsay something
```

## Executing one-off commands

```shell
$ npx create-react-app my-new-react-app

$ npx browserify ./src/main.js -o ./dist/bundle.js

$ npx watchify ./src/main.js -o ./dist/bundle.js -v

$ npx node-sass --watch scss/ -o css/

$ npx eslint src/sample.js

$ npx mocha ./src-test
```

## Run commands with different Node.js versions

```shell
λ node --version
v8.10.0

λ npx node@10 --version
npx: installed 1 in 2.64s
Path must be a string. Received undefined
null
v10.7.0

λ node --version
v8.10.0
```

```
npx -p node@8 npm run build
```

## Execute a full shell command using one npx call w/ multiple packages

```whell
$ npx -p lolcatjs -p cowsay -c \
  'echo "$npm_package_name@$npm_package_version" | cowsay | lolcatjs'
...
 _____
< your-cool-package@1.2.3 >
 -----
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## Invoking gist-based scripts

```shell
λ npx https://gist.github.com/zkat/4bc19503fe9e9309e2bfaa2c58074d32
...
yay gist
```

## Invoking a command from a github repository

```shell
λ npx github:piuccio/cowsay hello
...
 _______
< hello >
 -------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## Run node binary with --inspect

```shell
$ npx --node-arg=--inspect cowsay
Debugger listening on ws://127.0.0.1:9229/....
```

## Shell auto-fallback

You can configure npx to run as your default fallback command when you type something in the command line with an @ but the command is not found. This includes installing packages that were not found in the local prefix either.

For example:

```shell
$ npm@4 --version
(stderr) npm@4 not found. Trying with npx...
4.6.1
$ asdfasdfasf
zsh: command not found: asfdasdfasdf
```

You can optionally pass through --no-install when generating the fallback to prevent it from installing packages if the command is missing.

### For bash@>=4:

```shell
$ source <(npx --shell-auto-fallback bash)
```

### For zsh:

```shell
$ source <(npx --shell-auto-fallback zsh)
```

### For fish:

```shell
$ source (npx --shell-auto-fallback fish | psub)
```

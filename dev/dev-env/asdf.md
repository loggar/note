# asdf

list all installable versions

```
asdf list-all python
asdf list-all golang
```

## go

Plug-in:

```sh
$ asdf list golang
  No such plugin: golang

$ asdf plugin-add go https://github.com/kennyp/asdf-golang.git
$ asdf plugin-add nodejs

$ asdf plugin-update --all

$ asdf list golang
  No versions installed
```

Install a `golang`:

```sh
$ asdf install golang 1.20.7

$ asdf list golang
  1.20.7
```

Uninstall a `golang`:

```sh
$ asdf uninstall golang 1.20.7
```

Set local `golang` for a project:

```sh
# $ asdf local golang 1.20.7
# From version 0.18.0
$ asdf set golang 1.20.7
```

This will update this file:

`.tool-versions`

```
golang 1.20.7
```

Alternatively, you can set the global version like this:

```sh
$ asdf global golang 1.20.7
```

Set `$GOROOT`:

```sh
$ export GOROOT=$(asdf where golang)/go
```

Clean the Cache and Workspace: before building, clean your workspace and Go's build cache:

```sh
$ go clean -cache && go clean -modcache
```

## environment variables

```
export GOPATH=$HOME/ws-loggar/go
export GOROOT=$(asdf where golang)/go && export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
```

## goland

Settings > GO > GOROOT -> select go root for the project

## vscode

`settings.json`

```
{
    "go.goroot": "/Users/charly.lee/.asdf/installs/golang/1.20/go",
    "go.toolsGopath": "/Users/charly.lee/ws-loggar/go"
}
```

## install with `.tool-versions` and `--ordered-install`

https://github.com/asdf-vm/asdf/pull/1723

```
asdf install --ordered-install
```

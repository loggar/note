# alpine (root)

## zsh

```
$ echo $0
ash

$ apk update && apk add zsh

$ vi /etc/passwd
# root:x:0:0:root:/root:/bin/ash -> root:x:0:0:root:/root:/bin/zsh

# or
# sed -i 's|/bin/ash|/bin/zsh|' /etc/passwd
```

`/root/.zshrc`

```
# Custom prompt
PROMPT='%n@%m:%~# '
```

```
$ source /root/.zshrc
```

## asdf

```
$ apk update
$ apk add git curl bash

$ git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
```

`/root/.zshrc`

```
# asdf configuration
export ASDF_DIR="$HOME/.asdf"
. $ASDF_DIR/asdf.sh
. $ASDF_DIR/completions/asdf.bash
```

## git

global:

```
git config --global user.name "Your Global Name"
git config --global user.email "your.global.email@example.com"
```

local (project):

```
git config user.name ""
git config user.email ""

git config --list
```
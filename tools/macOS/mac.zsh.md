# zsh

iTerm2 and oh-my-zsh (Material colour profile)

## plugins

- fzf
- zsh-syntax-highlighting

## fzf

```
history: ctrl + r
```

## prompt

git branch:

```sh
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
export PROMPT='%~ $(parse_git_branch) $ '
```

## config

`.zshrc`

```sh
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
    git
    fzf
)

source $ZSH/oh-my-zsh.sh

alias python=/opt/homebrew/bin/python3

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

PROMPT='%~ $(parse_git_branch) $ '
```

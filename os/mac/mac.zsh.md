# zsh

iTerm2 and oh-my-zsh (Material colour profile)

## plugins

- fzf
- zsh-syntax-highlighting

## fzf

```
history: ctrl + r
```

`zsh-syntax-highlighting`

```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

## prompt

git branch:

```sh
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# PROMPT='%~ %# '
PROMPT='%~ $(parse_git_branch) $ '
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
    zsh-syntax-highlighting
)
echo "[ZSH plugins] $plugins"

source $ZSH/oh-my-zsh.sh

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

PROMPT='%~ $(parse_git_branch) $ '
```

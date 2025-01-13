# Bash

## bashrc

`.bashrc`

### show git branch

```sh
# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
unset color_prompt force_color_prompt
```

### color

```
LS_COLORS=$LS_COLORS:'di=0;31:' ; export LS_COLORS
```

## oh-my-bash

- https://github.com/ohmybash/oh-my-bash

### install

via curl

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
```

via wget

```
sh -c "$(wget https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh -O -)"
```

### theme

Theme List

- https://github.com/ohmybash/oh-my-bash/tree/master/themes

```
/home/username/.oh-my-bash/themes/
```

`.bashrc`

```
OSH_THEME="powerline-plain"
```

### update

```
upgrade_oh_my_bash
```

### uninstall

```
uninstall_oh_my_bash
```

# zsh

## install

```
sudo apt install zsh
```

```
$ which zsh
/usr/bin/zsh

$ echo $SHELL
/bin/bash

# set default shell, apply for next login
$ chsh -s /bin/bash username

$ echo $SHELL
/usr/bin/zsh
```

## oh-my-zsh

- https://github.com/robbyrussell/oh-my-zsh

### install

via curl

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

via wget

```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```

### theme

Theme List

- https://github.com/robbyrussell/oh-my-zsh/wiki/themes
- https://github.com/robbyrussell/oh-my-zsh/tree/master/themes/

```
/home/username/.oh-my-zsh/themes/
```

`.zshrc`

```
ZSH_THEME="flazz"
```

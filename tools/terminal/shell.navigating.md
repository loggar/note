# Shell Command-line

## Hacks

### go to begin, end

If you wrote a very long command in the terminal it may take a long time before you return to the begging of the line to add missing sudo. And back to the end to add some parameters.

Press `crtl + a` to move to the begging and `crtl + e` to the end of the line in terminal.

## Navigating the Command Line

### Basic Navigation

| Go to beginning / end                   | Ctrl + a / Ctrl + e |
| --------------------------------------- | ------------------- |
| Go backwards / forwards one word        | Alt + b / Alt + f   |
| Delete next word                        | Alt + d             |
| Delete all the way to the beginning[^1] | Ctrl + u            |
| Delete all the way to the end           | Ctrl + k            |

### Searching in previous commands

| Search backwards / forwards | Ctrl + r / Ctrl + s       |
| --------------------------- | ------------------------- |
| Run the command             | Enter                     |
| Edit the command            | Right Arrow / Right Arrow |
| Stop searching              | Ctrl + g                  |

### Editing In-Place

These tips and tricks are helpful, but if you are working with a really long or complex command, you might find it useful just to jump into your favourite editor.

`Ctrl + x` / `Ctrl + e`

### Clear the Screen

`Ctrl + l`

## Moving around

### Where Am I?

```
pwd
```

### cd

```
$ pwd
/Users/dave/repos/github/dwmkerr/effective-shell

$ cd

$ pwd
/users/dave

$ cd -
~/repos/github/dwmkerr/effective-shell

$ pwd
/Users/dave/repos/github/dwmkerr/effective-shell

$ cd ~

$ pwd
/users/dave

$ cd /dev

$ cd ~/repos

$ cd ./github

$ pwd
/Users/dave/repos/github/dwmkerr/effective-shell

$ cd ../../

$ pwd
/Users/dave/repos/github
```

### ls

```sh
$ ls

$ ls -l # long format

$ ls -lhS # human readable, sort by size
```

### Auto-Completion

```
$ cd ~/repos/       # press 'tab' now...
github/   gitlab/   local/    scratch/


% cd ~/r/g/d/e    # press tab now...

% cd ~/repos/github/dwmkerr/effective-
effective-container-engineering/  effective-shell/
```

## What, Where, Who

```
$ what /bin/ls

$ whatis bash

$ which -a vi

$ whence brew

$ where ls

$ whereis ls

$ type -a ls
```

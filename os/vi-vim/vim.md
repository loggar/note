# vim

## Install

```sh
#[On Debian/Ubuntu]
apt-get install vim

#[On RHEL/CentOS]
yum install vim

#[Fedora 22+]
dnf install vim
```

## Edit file in VIM without sudo, but save with sudo

```
:w !sudo tee %
```

## Modes in VIM

Vim's design is based on the idea that a lot of programmer time is spent reading, navigating, and making small edits, as opposed to writing long streams of text. For this reason, Vim has multiple operating modes.

- Normal: for moving around a file and making edits
- Insert: for inserting text
- Replace: for replacing text
- Visual (plain, line, or block): for selecting blocks of text
- Command-line: for running a command

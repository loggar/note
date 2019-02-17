# WSL interact beween Windows and WSL

## Interact with Windows Storage

Windows -> WSL

```
C:\Users\webnl\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\loggar
```

WSL -> Windows

```
/mnt/c
```

### permission issue

After copy files (directories) to `C:\Users\webnl\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\loggar`

In the WSL, permission modification needed.

For a copied directory `express-docker-simple-ex-1`, apply chmod for the directory and all recursive sub-directories.

```
sudo chmod 755 -R ./docker-simple-ex-1

cd docker-simple-ex-1
```

```
loggar@DT-Charly:~/_workspace$ ls
work_ex_1
loggar@DT-Charly:~/_workspace$ sudo chmod 755 -R ./work_ex_1
[sudo] password for loggar:
loggar@DT-Charly:~/_workspace$ ls -la ./work_ex_1
total 0
drwxr-xr-x 1 loggar loggar 512 Feb  4 10:53  .
drwxrwxrwx 1 loggar loggar 512 Feb  4 10:53  ..
-rwxr-xr-x 1 loggar loggar   5 Feb 18 10:23 'wsl file permission test.txt'
```

### WSL bash

In windows Command prompt (or PowerShell prompt or any other terminal), WSL bash can be accessed with `current path`.

```
C:\_loggar\_workspace\loggar-note\node (master)
λ bash
loggar@DESKTOP-CLQSJPF:/mnt/c/_loggar/_workspace/loggar-note/node$
```

## Accessing Linux files from Windows

### Linux files inside of File explorer

The best way to get started with this feature is to open your Linux files in File Explorer! To do this, open your favorite distro, make sure your current folder is your Linux home directory, and type in:

```
explorer.exe .
```

### In command line

WSL is primarily a command line tool, and so of course this feature also works in the command line. You can find your distro’s files by accessing `\\wsl$\{distro name}\` where `{distro name}` is the name of a running distro. Here’s what it looks like to access Debian with PowerShell.

```PowerShell
cd \\wsl$\Debian\

ls
```
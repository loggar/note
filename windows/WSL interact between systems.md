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
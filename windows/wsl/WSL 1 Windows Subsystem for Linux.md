# Windows Subsystem for Linux

## install

Open PowerShell as Administrator and run:

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Restart your computer when prompted.

## Install your Linux Distribution of Choice

To download and install your preferred distro(s), you have three choices:

### 1. Download and install from the Windows Store

- open windows store and search "linux"
- get a linux distribution you want to install

### 2. Download and install from the Command-Line/Script

Download using PowerShell

```PowerShell
Invoke-WebRequest -Uri https://aka.ms/wsl-ubuntu-1604 -OutFile Ubuntu.appx -UseBasicParsing
```

> If the download is taking a long time, turn off the progress bar by setting `$ProgressPreference = 'SilentlyContinue'`

Download using curl

```console
curl.exe -L -o ubuntu-1604.appx https://aka.ms/wsl-ubuntu-1604
```

In the above example, curl.exe is executed (not just curl) to ensure that, in PowerShell, the real curl executable is invoked, not the PowerShell curl alias for Invoke-WebRequest

> Using curl might be preferable if you have to invoke/script download steps using Cmd shell and/or `.bat` / `.cmd` scripts.

### 3. Download and manually unpack and install (for Windows Server)

> Applies to Windows Server 2019 and later

1. Download a Linux distro (refer "Download and install from the Command-Line/Script")

2. Extract and install a Linux distro

Now that you've downloaded a distro, extract its contents and manually install the distro:

```PowerShell
Rename-Item ~/Ubuntu.appx ~/Ubuntu.zip
Expand-Archive ~/Ubuntu.zip ~/Ubuntu
```

Make sure your target directory (`~/Ubuntu` in this example) is on your system drive. Usually this is your `C:` drive. For example: `C:\Distros\Ubuntu`

3. Run the distro launcher

Run the distro launcher To complete installation, run the distro launcher application in the target folder, named `<distro>.exe`. For example: `ubuntu.exe`, etc.

## Complete initialization of your distro

Now that your Linux distro is installed, you must initialize your new distro instance once, before it can be used.

### Setting up a new Linux user account

Once installation is complete, you will be prompted to create a new user account (and its password).

This user account is for the normal non-admin user that you'll be logged-in as by default when launching a distro.

You can choose any username and password you wish - they have no bearing on your Windows username.

When you open a new distro instance, you won't be prompted for your password, but if you elevate a process using sudo, you will need to enter your password, so make sure you choose a password you can easily remember! See the User Support page for more info.

### Update & upgrade your distro's packages

Most distros ship with an empty/minimal package catalog. We strongly recommend regularly updating your package catalog, and upgrading your installed packages using your distro's preferred package manager. On Debian/Ubuntu, you use apt:

```bash
sudo apt update && sudo apt upgrade
```

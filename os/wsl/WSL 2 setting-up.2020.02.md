# WSL 2 installation

## windows version

```
PS C:\WINDOWS\system32> systeminfo | Select-String "^OS Name","^OS Version"

OS Name:                   Microsoft Windows 10 Pro
OS Version:                10.0.19041 N/A Build 19041
```

Windows build should be 18917 or higher.

## Enable WSL 1

```
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

```
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

Running the above commands will install Virtual Machine Platform and Windows Subsystem for Linux. Restart your computer. To confirm if WSL is enabled, run this command in PowerShell as Administrator.

```
Get-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

Enabled Message

```
FeatureName      : Microsoft-Windows-Subsystem-Linux
DisplayName      : Windows Subsystem for Linux
Description      : Provides services and environments for running native user-mode Linux shells and tools on Windows.
RestartRequired  : Possible
State            : Enabled
CustomProperties :
                   ServerComponent\Description : Provides services and environments for running native user-mode Linux
                   shells and tools on Windows.
                   ServerComponent\DisplayName : Windows Subsystem for Linux
                   ServerComponent\Id : 1033
                   ServerComponent\Type : Feature
                   ServerComponent\UniqueName : Microsoft-Windows-Subsystem-Linux
                   ServerComponent\Deploys\Update\Name : Microsoft-Windows-Subsystem-Linux
```

## Install a Linux distribution

Install Ubuntu distro.

```
Microsoft Store -> Ubuntu xx.xx LTS
```

## Setting up a new Linux user account

```
username:
password:
```

if you elevate a process using sudo, you will need to enter your password

## Enable WSL 2

```
PS C:\WINDOWS\system32> wsl -l -v
  NAME            STATE           VERSION
* Ubuntu-18.04    Stopped         1
```

Set WSL version the distro uses

```
wsl --set-version Ubuntu-18.04 2
```

```
PS C:\WINDOWS\system32> wsl -l -v
  NAME            STATE           VERSION
* Ubuntu-18.04    Stopped         2
```

Set default version:

```
wsl --set-default-version 2
```

## Launch distro

```
wsl
```

## Update & upgrade your distro's packages

```
sudo apt update && sudo apt upgrade
```

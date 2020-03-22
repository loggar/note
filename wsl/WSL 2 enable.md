# Windows Subsystem for Linux WSL2

## Prerequisite

- Windows 10 bulild 18917 or higher
- Have WSL already installed

## Enable the 'Virtual Machine Platform' optional component

PowerShell (Administrator)

```
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform
```

## Set a distro to be backed by WSL 2 using the command line

```
wsl --set-version <Distro> 2

wsl --set-version Ubuntu 2
```

Additionally, if you want to make WSL 2 your default architecture you can do so with this command:

```
wsl --set-default-version 2
```

## Verifying what versions of WSL your distro are using

```
wsl --list --verbose

# or

wsl -l -v
```

## Windows 10 Insider Preview Builds

Install

```
Go to Settings > Update & Security > Windows Insider Program and click Get Started to access the latest build.

1. Enter the account you used to sign into the Windows Insider Program.
2. Follow the prompts to install.
3. Go to Settings > Update & Security > Windows Update and click Check for updates to install.
```

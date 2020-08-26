# chocolatey/choco

https://github.com/chocolatey/choco/wiki/Installation

## Requirements

* Windows 7+ / Windows Server 2003+
* PowerShell v2+
* .NET Framework 4+ (the installation will attempt to install .NET 4.0 if you do not have it installed)

## Installing Chocolatey

### Install with cmd.exe

```cmd
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
```

### Install with PowerShell.exe version 2+

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

### Install from PowerShell v3+

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
```

### verions check

```
PS C:\users\webnl> choco --version
0.10.11
```
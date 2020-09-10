# Powershell Modules

## Find and Install Azure Powershell Module

```
Find-Module -Name Az | Install-Module
```

## Inspecting PowerShell Modules

Installed Modules

```
Get-Module -Name Az -ListAvailable
```

Import Modules

```
Import-Module Az
```

## Inspecting Commands in Modules

```
Get-Command -Module Az

Get-Command -Module Az.Compute
```

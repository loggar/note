When Windows 10 Search Click & Enter not work

```
window + R : run -> services.msc
windows search -> context menu -> restart.

```


When Windows 10 Start button not work

```
CTRL+Shift+ESC - powershell

$manifest = (Get-Appxpackage Microsoft.WindowsStore).installLocation + '\AppxManifest.xml';Add -AppxPackage -DisableDevelopmentMode -Register $manifest

reboot.
```
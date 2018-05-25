윈도우10 wndow search 클릭과 엔터 동작 안할때

```
window + R : run -> services.msc
windows search -> context menu -> restart.

```


윈도우10 시작버튼 작동 안할때

```
CTRL+Shift+ESC - powershell

$manifest = (Get-Appxpackage Microsoft.WindowsStore).installLocation + '\AppxManifest.xml';Add -AppxPackage -DisableDevelopmentMode -Register $manifest

reboot.
```
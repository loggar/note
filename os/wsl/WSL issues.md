# WSL issues on my device

## Error: 0x800703fa

```
Installing, this may take a few minutes...
WslRegisterDistribution failed with error: 0x800703fa
Error: 0x800703fa Illegal operation attempted on a registry key that has been marked for deletion.
```

cause:

LXSS service was not started for some reason. Turning it on appears to have resolved the issue.

solution:

```
C:\Windows\System32\bash.exe -c "sudo /usr/sbin/service ssh --full-restart"
```

## Unable to convert to version 2

```
PS C:\Users\username> wsl --set-version WLinux 2
Conversion in progress, this may take a few minutes...
For information on key differences with WSL 2 please visit https://aka.ms/wsl2
Exporting the distribution failed.
bsdtar: Write error
```

solution:

```
Windows Start - Settings - Update & Security - Windows Security - Virus & threat protection - Manage settings (or Virus & threat protection settings)

> Turn Off: Real-time protection
```

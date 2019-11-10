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

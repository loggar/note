# WSL 2 Resources

## Setting boundaries for WSL2

`c:\users\<profile name>\.wslconfig`

```
[wsl2]
memory=4GB # Limits VM memory in WSL 2 to 4 GB
processors=5 # Makes the WSL 2 VM use two virtual processors
```

And then, from Powershell with admin rights, restart WSL2 by typing:

```
Restart-Service LxssManager
```

# Windows NVM

## Installation

```
Invoke-WebRequest -Uri "https://github.com/coreybutler/nvm-windows/releases/latest/download/nvm-setup.exe" -OutFile "$env:TEMP\nvm-setup.exe"
Start-Process "$env:TEMP\nvm-setup.exe" -Wait
```

Set version

```
nvm install lts
nvm use <version>
```

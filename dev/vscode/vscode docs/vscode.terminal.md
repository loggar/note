# vscode terminal

`vscode command prompt (Ctrl + Shift + p)` - `terminal` - `select default shell`.

## Windows

### Command Prompt

```json
{
  "terminal.integrated.shell.windows": "C:\\_dev\\git\\bin\\bash.exe"
}
```

### PowerShell

```json
{
  "terminal.integrated.shell.windows": C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
}
```

### Git Bash

```json
{
  "terminal.integrated.shell.windows": "C:\\_dev\\git\\bin\\bash.exe"
}
```

### WSL (Ubuntu) bash

64-bit arch Windows, 64-bit arch Application or 32-bit arch Windows, 32-bit arch Application:

```json
{
  // terminal: WSL bash
  "terminal.integrated.shell.windows": "C:\\WINDOWS\\system32\\wsl.exe",
  // eol: unix-format
  "files.eol": "\n"
}
```

64-bit arch Windows, 32-bit arch Application:

```json
{
  "terminal.integrated.shell.windows": "C:\\WINDOWS\\sysnative\\bash.exe"
  // eol: unix-format
  "files.eol": "\n"
}
```

## Interactive mode

When add arg `-i`, the profile loaded from `.zshrc`, variables will be same with external variables.

```
  "terminal.integrated.profiles.osx": {
    "zsh": {
      "args": [
        "-i"
      ],
      "path": "/opt/homebrew/bin/zsh"
    }
  },
```

Other terminal settings:

```
  "terminal.integrated.enableMultiLinePasteWarning": false,
  "terminal.integrated.persistentSessionScrollback": 9999,
```

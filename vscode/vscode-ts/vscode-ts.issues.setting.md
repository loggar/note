# vscode typescript

## typescript build task

When vscode using `git bash` or `wsl bash` as its internal terminal, running `vscode build task` (tsc - typescript build) emit an error with parsing the path of `typescript config file`.

force using cmd or powershell for vscode internal terminal:

```json
// settings.json
{
  // PowerShell
  "terminal.integrated.shell.windows": "C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe"
}
```

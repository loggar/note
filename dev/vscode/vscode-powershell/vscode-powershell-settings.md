# vscode powershell

## Extension

vscode extension name: PowerShell

## settings

File -> Preferences -> Settings

`settings.json`

On Windows:

```json
{
  "powershell.powerShellExePath": "c:/Program Files/PowerShell/<version>/pwsh.exe"
}
```

On Linux:

```json
{
  "powershell.powerShellExePath": "/opt/microsoft/powershell/<version>/pwsh"
}
```

On macOS:

```json
{
  "powershell.powerShellExePath": "/usr/local/microsoft/powershell/<version>/pwsh"
}
```

And recommendations

```json
{
  "csharp.suppressDotnetRestoreNotification": true,
  "editor.renderWhitespace": "all",
  "editor.renderControlCharacters": true,
  "omnisharp.projectLoadTimeout": 120,
  "files.trimTrailingWhitespace": true
}
```

If you don't want these settings to affect all files types, VSCode also allows per-language configurations. Create a language specific setting by putting settings in a [`<language-name>`] field. For example:

```json
"[powershell]": {
    "files.encoding": "utf8bom",
    "files.autoGuessEncoding": true
}
```
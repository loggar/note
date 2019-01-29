# Debugging Angular CLI Apps inside VSCode with Browser Preview

ref) https://medium.com/@MarkPieszak/debugging-angular-cli-inside-vscode-with-browser-preview-8dcc4b18ed64

`launch.json`

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Launch Program .ts",
      "program": "${fileDirname}/${fileBasenameNoExtension}.js"
    },
    {
      "type": "node",
      "request": "attach",
      "name": "Attach to Process",
      "port": 5858
    },
    {
      "type": "browser-preview",
      "name": "Browser Preview: Attach",
      "request": "attach"
    },
    {
      "type": "browser-preview",
      "name": "Browser Preview: Launch",
      "request": "launch",
      "url": "http://localhost:4200",
      "webRoot": "${fileDirname}"
    }
  ]
}
```


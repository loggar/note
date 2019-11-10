# Debugging Angular CLI Apps inside VSCode with Browser Preview

## Dependencies

vscode extensions:

- Debugger for Chrome
- Browser Preview

## `launch.json`

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

Run debug `<browser-preview: Launch>` on Angular components, for example.

![Browser Preview Debug Run example](https://loggar.github.io/note/settings/vscode.extensions.browser-preview.png)

# python vscode: env

`py.dev.env`

```
# dev.env - development configuration

# python cache
PYTHONDONTWRITEBYTECODE=0
```

`settings.json`
```json
{
  "python.envFile": "${workspaceFolder}/py.dev.env",
}
```

`launch.json`
```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python",
      "type": "python",
      "request": "launch",
      "stopOnEntry": false,
      "pythonPath": "${config:python.pythonPath}",
      "program": "${file}",
      "cwd": "${workspaceFolder}",
      "envFile": "${workspaceFolder}/py.dev.env",
      "env": {}
    }
  ]
}
```

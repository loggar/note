# vscode virtualenv

## Select and activate an environment

```json
"python.disableInstallationCheck": true
```

Command Palette (`Ctrl+Shift+P`) - Python: Select Interpreter : venv

Selecting an interpreter from the list adds an entry for python.pythonPath with the path to the interpreter inside your Workspace Settings. Because the path is part of the workspace settings, the same environment should already be selected whenever you open that workspace.

Tip: To prevent automatic activation of a selected environment, add "`python.terminal.activateEnvironment": false` to your settings.json file.

Note: By default, VS Code uses the interpreter identified by `python:pythonPath` setting when debugging code. You can override this behavior by specifying a different path in the `pythonPath` property of a debug configuration.

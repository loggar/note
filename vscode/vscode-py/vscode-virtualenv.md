# vscode virtualenv

## Make a new virtualenv for an workspace

```
λ virtualenv .venv
```

## Select and activate an environment

```json
"python.disableInstallationCheck": true
```

Command Palette (`Ctrl+Shift+P`) - **Python: Select Interpreter : venv**

Selecting an interpreter from the list adds an entry for python.pythonPath with the path to the interpreter inside your Workspace Settings. Because the path is part of the workspace settings, the same environment should already be selected whenever you open that workspace.

Tip: To prevent automatic activation of a selected environment, add "`python.terminal.activateEnvironment": false` to your settings.json file.

Note: By default, VS Code uses the interpreter identified by `python:pythonPath` setting when debugging code. You can override this behavior by specifying a different path in the `pythonPath` property of a debug configuration.

## Can not perform a `--user` install

```
PS C:\Users\webnl\Documents\_workspace\loggar-py> & c:/Users/webnl/Documents/_workspace/loggar-py/.venv/Scripts/python.exe -m pip install -U pylint --user
Can not perform a '--user' install. User site-packages are not visible in this virtualenv.

PS C:\Users\webnl\Documents\_workspace\loggar-py> & c:/Users/webnl/Documents/_workspace/loggar-py/.venv/Scripts/python.exe -m pip install pylint
# It will work.
```
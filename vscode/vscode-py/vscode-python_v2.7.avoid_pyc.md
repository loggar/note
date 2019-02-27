# python 2.7 Avoid make bytecode (pyc, pyo)

## launch

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
      "cwd": "${fileDirname}",
      "envFile": "${workspaceFolder}/.env",
      "env": {
        "PYTHONDONTWRITEBYTECODE": "True"
      }
    }
  ]
}
```

## pytest

### using pytest-env

```
pip install pytest-env
```

`pytest.ini`
```
[pytest]
env =
    PYTHONDONTWRITEBYTECODE=1
```

`settings.json`
```json
{
 "python.unitTest.unittestEnabled": true,
  "python.unitTest.pyTestEnabled": true,
  "python.unitTest.pyTestPath": ".venv\\Scripts\\pytest.exe",
  "python.unitTest.pyTestArgs": ["-c", "pytest.ini"]
}
```
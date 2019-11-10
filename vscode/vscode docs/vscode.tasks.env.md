# vscode tasks with setting environment variables

```json
{
    // See https://go.microsoft.com/fwlink/?LinkId=733558
    // for the documentation about the tasks.json format
    "version": "2.0.0",
    "tasks": [
        {
            "label": "diagnostic",
            "type": "shell",
            "options": {
                "cwd": "${workspaceFolder}/beam",
                "env": {
                    "FOO": "baz",
                }
            },
            "command": "printenv",
            "problemMatcher": []
        }
    ]
}
```

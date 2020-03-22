# launch jasmine test for this file

## install jasmine (global)

```
install -g jasmine
```

## add test-task to vscode task.json

tasks.json version 2.0.0

```
{
	"label": "Test (Jasmine)",
	"command": "jasmine",
	"group": "test",
	"args": [],
	"problemMatcher": {
		"owner": "javascript",
		"fileLocation": [
			"absolute"
		],
		"severity": "error",
		"pattern": [
			{
				"regexp": "Message.*"
			},
			{
				"regexp": "[^ ](.*)",
				"message": 1
			},
			{
				"regexp": "Stack.*"
			},
			{
				"regexp": "at +.*\\((.*\\\\*.ts):(\\d+):(\\d+)\\)",
				"file": 1,
				"line": 2,
				"column": 3
			}
		]
	}
}
```

## run test for specific file on vscode

```
task - run test task
```

# launch jasmine test for this file

## install jasmine (global)

```
install -g jasmine
```

## add test-task to vscode task.json

```
// tasks : 
{
	"isTestCommand": true,
	"isBackground": false,
	"taskName": "jasmine",
	"command": "jasmine",
	"args": [
		"${file}"
	],
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
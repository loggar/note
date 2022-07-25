# vscode - launch jest test

## install

```
npm install -D babel-cli babel-core @babel/preset-env babel-plugin-transform-function-bind babel-jest jest
```

## node settings

```json
// .babelrc

{
	"presets": [
		"@babel/preset-env"
	],
	"plugins": [
		"transform-function-bind"
	]
}
```

```js
// jest.config.js

module.exports = {
  testEnvironment: 'node'
};
```

## vscode settings

```json
// task.json
{
  "version": "0.2.0",
  "configurations": [
    {
      "type": "node",
      "request": "launch",
      "name": "Launch Program .js",
      "program": "${file}",
      "cwd": "${workspaceRoot}"
    },
    {
      "type": "node",
      "request": "attach",
      "name": "Attach to Process",
      "port": 5858
    },
    {
      "type": "node",
      "request": "launch",
      "name": "Jest Current File",
      "program": "${workspaceFolder}/node_modules/.bin/jest",
      "args": [
        "${relativeFile}",
        "--config",
        "${workspaceFolder}/jest.config.js"
      ],
      "console": "integratedTerminal",
      "internalConsoleOptions": "neverOpen",
      "disableOptimisticBPs": true,
      "windows": {
        "program": "${workspaceFolder}/node_modules/jest/bin/jest"
      }
    },
    {
      "type": "node",
      "request": "launch",
      "name": "Jest All",
      "program": "${workspaceFolder}/node_modules/.bin/jest",
      "args": ["--runInBand", "--config", "${workspaceFolder}/jest.config.js"],
      "console": "integratedTerminal",
      "internalConsoleOptions": "neverOpen",
      "disableOptimisticBPs": true,
      "windows": {
        "program": "${workspaceFolder}/node_modules/jest/bin/jest"
      }
    }
  ]
}
```

# Run Test with vscode

Debug (`Ctrl+Shift+D`)

choose launch config

Run (`F5`)

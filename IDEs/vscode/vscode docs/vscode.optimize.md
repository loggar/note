# vscode optimize

## Telemetry

VSCode sends data to Microsoft about it's usage

```
"telemetry.enableCrashReporter": false,
"telemetry.enableTelemetry": false
```

## Search Indexing

```
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "**/venv": true
  }
```

## File Watcher

```
  "files.watcherExclude": {
    "**/.git/objects/**": true,
    "**/.git/subtree-cache/**": true,
    "**/node_modules/**": true,
    "**/venv/**": true,
  },
```

## Files in Explorer

```
  "files.exclude": {
    "**/.git": true
  }
```

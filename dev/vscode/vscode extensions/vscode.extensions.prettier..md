# Vscode Extensions - Prettier

`settings.json`

```json
  "[javascript]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[jsonc]": {
    "editor.defaultFormatter": "vscode.json-language-features"
  },
  "[json]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[html]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
  "[markdown]": {
    "editor.defaultFormatter": "yzhang.markdown-all-in-one"
  },
  "[typescriptreact]": {
    "editor.defaultFormatter": "esbenp.prettier-vscode"
  },
```

## Workspace prettier config

`.prettierrc`

```json
{
  "overrides": [
    {
      "files": "*.json",
      "options": {
        "printWidth": 1
      }
    }
  ]
}
```

## issue: vscode - prettier does not work after vscode update.

Uninstall prettier extension and reinstall it.

# Commit linter

```
npm install -g @commitlint/cli @commitlint/config-conventional commitlint-plugin-gitmoji
```

```
touch ~/.commitlintrc.js
```

## To lint the most recent commit message manually, without relying on a Git hook, you can use the following command

```
npx commitlint --from HEAD~1
```

## Set Up a Global Git Hook

```
mkdir -p ~/.git-hooks

git config --global core.hooksPath ~/.git-hooks

touch ~/.git-hooks/commit-msg
```

`~/.git-hooks/commit-msg`:

```
#!/bin/sh
npx commitlint --edit "$1"
```

```
chmod +x ~/.git-hooks/commit-msg
```

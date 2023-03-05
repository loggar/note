# Commit Message

## Conventions

- feat: A new feature
- fix: A bug fix
- docs: A documentation change
- style: A code style change, doesn’t change implementation details
- refactor: A code change that neither fixes a bug or adds a feature
- perf: A code change that improves performance
- test: When testing your code
- chore: Changes to the build process or auxiliary tools and libraries
- settings: configurations, settings

They follow this syntax: `<type>(<scope>): <subject>`

```
git commit -m "feat(todo-list) add filter feature"
```

### frequently used

```
fix (typo)

refactor (dependencies) security vulnerabilities

docs (git) commit msg conventions
```

## Fixing the Commit Message Before 'git push'

```
git commit --amend -m 'New commit message'
```

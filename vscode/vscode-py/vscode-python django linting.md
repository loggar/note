# vscode - python

## linter plugin for django

Example error message:

```
E1101: Class 'Question has no objects member`
```

```
$ pip install pylint-django
```

`settings.json`

```
"python.linting.pylintArgs": [
     "--load-plugins=pylint_django"
]
```

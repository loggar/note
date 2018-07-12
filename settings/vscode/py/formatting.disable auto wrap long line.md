
## visual studio code disable auto wrap long line


Check the Python formatting provider.

``` json
// workspace settings.json
"python.formatting.provider": "autopep8"
```

in this case it is not PyLint who keeps wrapping the long lines, but autopep8.Try setting --max-line-length for autopep8 instead.

``` json
// workspace settings.json
"python.formatting.autopep8Args": [
    "--max-line-length=256"
]
```
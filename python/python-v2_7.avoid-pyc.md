# python 2.7 Avoid make bytecode (pyc, pyo)

## cmd

```
(.venv) λ set PYTHONDONTWRITEBYTECODE=True
(.venv) λ pytest

(.venv) λ set PYTHONDONTWRITEBYTECODE=True && pytest
```

## powershell

```
(.venv) $Env:PYTHONDONTWRITEBYTECODE = 'True'
(.venv) pytest

(.venv) $Env:PYTHONDONTWRITEBYTECODE = 'True'; pytest
```

## bash

```
(.venv) export PYTHONDONTWRITEBYTECODE=1
(.venv) pytest

(.venv) export PYTHONDONTWRITEBYTECODE=1 && pytest
```

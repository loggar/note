# pytest-env

## settings

```
pip install pytest-env
```

`pytest.ini`

```
[pytest]
env =
    PYTHONDONTWRITEBYTECODE=True
```

## run pytest with env file

```
pytest -c pytest.ini
```

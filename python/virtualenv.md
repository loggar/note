# python virtualenv

## add windows path (if not set yet)

```
C:\_dev\python\Python37-32\Scripts
```

## install virtualenv

```
C:\_dev\python\Python37-32\Scripts
λ pip install virtualenv
```

```
λ virtualenv --version
16.0.0
```

## use virtualenv for an workspace

```
λ virtualenv .venv
```

### activate virtual env for the workspace

```
# Windows
λ .venv\Scripts\activate

(.venv) λ where python
C:\Users\webnl\Documents\_workspace\loggar-py\.venv\Scripts\python.exe
C:\_dev\python\Python37-32\python.exe


# MacOS
$ . ./venv/activate

(.venv) λ which python
/c/Users/webnl/Documents/_workspace/loggar-py/.venv/Scripts/python
```

### install packages

```
(.venv) λ pip list

(.venv) λ pip install jupyter
```

or, with requirements file:

`requirements.txt`

```
Flask==0.12.3
click==6.7
gunicorn==19.7.1
itsdangerous==0.24
Jinja2==2.9.6
MarkupSafe==1.0
pytz==2017.2
requests==2.13.0
Werkzeug==0.12.1
```

```
(.venv) λ pip install -r requirements.txt

(.venv) λ pip list
```

### deactivate

```
(.venv) λ deactivate
```

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

### make virtualenv for an workspace with different python version from system environment

```
virtualenv --python=C:\_dev\python\Python27\python.exe .venv
```

### activate virtual env for the workspace

```
# Windows cmd
λ .venv\Scripts\activate

# Windows powershell
$ .venv\Scripts\Activate.ps1

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
jupyter==1.0.0
pytest==4.2.0
pylint==2.2.2
autopep8==1.4.3
```

```
(.venv) λ pip install -r requirements.txt

(.venv) λ pip list
```

### deactivate

```
(.venv) λ deactivate
```

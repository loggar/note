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
pip list

pip install jupyter
```

### deactivate

```
C:\Users\webnl\Documents\_workspace\loggar-py (master)
(.venv) λ deactivate
```

# python environments

## virtualenv

install virtualenv

```
C:\_dev\python\Python37-32\Scripts
λ pip install virtualenv
Collecting virtualenv
  Downloading https://files.pythonhosted.org/packages/b6/30/96a02b2287098b23b875bc8c2f58071c35d2efe84f747b64d523721dc2b5/virtualenv-16.0.0-py2.py3-none-any.whl (1.9MB)
Installing collected packages: virtualenv
  The script virtualenv.exe is installed in 'c:\_dev\python\python37-32\Scripts' which is not on PATH.
  Consider adding this directory to PATH or, if you prefer to suppress this warning, use --no-warn-script-location.
Successfully installed virtualenv-16.0.0
```

add windows path (if not set yet)

```
C:\_dev\python\Python37-32\Scripts
```

```
λ virtualenv --version
16.0.0
```

use virtualenv for an workspace

```
C:\Users\webnl\Documents\_workspace\loggar-py (master)
λ virtualenv .venv
Using base prefix 'c:\\_dev\\python\\python37-32'
New python executable in C:\Users\webnl\Documents\_workspace\loggar-py\.venv\Scripts\python.exe
Installing setuptools, pip, wheel...done.
```

activate virtual env for the workspace

```
# MacOS
$ . ./venv/activate

# Windows
C:\Users\webnl\Documents\_workspace\loggar-py (master)
λ .venv\Scripts\activate

C:\Users\webnl\Documents\_workspace\loggar-py (master)
(.venv) λ
```

deactivate

```
C:\Users\webnl\Documents\_workspace\loggar-py (master)
(.venv) λ deactivate
C:\Users\webnl\Documents\_workspace\loggar-py (master)
λ
```

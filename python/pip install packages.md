# pip

## install packages

```
pip install requests
```

## Installing specific versions

```
pip install requests==2.18.4

pip install requests>=2.0.0,<3.0.0

pip install --pre requests
```

## Installing extras

Some packages have optional extras. You can tell pip to install these by specifying the extra in brackets:

```
pip install requests[security]
```

## Installing from source

```
cd google-auth
pip install .
```

Additionally, pip can install packages from source in development mode, meaning that changes to the source directory will immediately affect the installed package without needing to re-install:

```
pip install --editable .
```

## Installing from version control systems

pip can install packages directly from their version control system. For example, you can install directly from a git repository:

```
git+https://github.com/GoogleCloudPlatform/google-auth-library-python.git#egg=google-auth
```

## Installing from local archives

```
pip install requests-2.18.4.tar.gz
```

If you have a directory containing archives of multiple packages, you can tell pip to look for packages there and not to use the Python Package Index (PyPI) at all:

```
pip install --no-index --find-links=/local/dir/ requests
```

This is useful if you are installing packages on a system with limited connectivity or if you want to strictly control the origin of distribution packages.

## Using other package indexes

If you want to download packages from a different index than the Python Package Index (PyPI), you can use the --index-url flag:

```
pip install --index-url http://index.example.com/simple/ SomeProject
```

If you want to allow packages from both the Python Package Index (PyPI) and a separate index, you can use the --extra-index-url flag instead:

```
pip install --extra-index-url http://index.example.com/simple/ SomeProject
```

## Upgrading packages

```
pip install --upgrade requests
```

## Using requirements files

Instead of installing packages individually, pip allows you to declare all dependencies in a Requirements File. For example you could create a requirements.txt file containing:

```
requests==2.18.4
google-auth==1.1.0
```

And tell pip to install all of the packages in this file using the -r flag:

```
pip install -r requirements.txt
```

## Freezing dependencies

Pip can export a list of all installed packages and their versions using the freeze command:

```
pip freeze
```

Which will output a list of package specifiers such as:

```
cachetools==2.0.1
certifi==2017.7.27.1
chardet==3.0.4
google-auth==1.1.1
idna==2.6
pyasn1==0.3.6
pyasn1-modules==0.1.4
requests==2.18.4
rsa==3.4.2
six==1.11.0
urllib3==1.22
```

This is useful for creating Requirements Files that can re-create the exact versions of all packages installed in an environment.

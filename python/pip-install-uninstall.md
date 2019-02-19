# pip

## pip list

```
$ pip search "query"

$ pip show package-name

$ pip list

$ pip list --outdated
```

## pip install

```
$ pip install package-name

$ pip install package-name==1.0.0

$ pip install package-name --upgrade

$ pip install package-name --upgrade --force-reinstall

$ pip uninstall package-name
```

## pip uninstall

```
pip uninstall [options] <package> ...
pip uninstall [options] -r <requirements file> ...
```

- `-r`, `--requirement` <file>: 
Uninstall all the packages listed in the given requirements file. This option can be used multiple times.

- `-y`, `--yes`: 
Don’t ask for confirmation of uninstall deletions.

```
$ pip uninstall simplejson
Uninstalling simplejson:
  /home/me/env/lib/python2.7/site-packages/simplejson
  /home/me/env/lib/python2.7/site-packages/simplejson-2.2.1-py2.7.egg-info
Proceed (y/n)? y
  Successfully uninstalled simplejson
```

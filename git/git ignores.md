# git ignore

## OS

```
# OS generate
.DS_Store
.DS_Store?
._*
.spotlight-V100
.Trashes
.Icon?
ehthumbs.db
Thumbs.db
```

## log

```
# log
*.log
npm-debug.log*
_log/
```

## MS office temporary files

```
# Word temporary
~$*.doc*

# Word Auto Backup File
Backup of *.doc*

# Excel temporary
~$*.xls*

# Excel Backup File
*.xlk

# PowerPoint temporary
~$*.ppt*

# Visio autosave temporary files
*.~vsd*
```

## cert

```
# ssl
ssl/
```

## IDE

```
# visual studio code
.vscode/

# eclipse
/.settings
/.project
/.classpath
```

## Java

```
/build
/target
/webapp/WEB-INF
/webapp/META-INF
```

## node

```
# node nodeenv
.nodeenv/

# node env
.env

# grunt intermediate storage
.grunt

# node-waf configuration
.lock-wscript

# dependency directories
node_modules/
jspm_packages/
bower_components/

# optional npm cache directory
.npm

# optional REPL history
.node_repl_history
```

## python

```
# python virtualenv
.venv/

# pytest
.pytest_cache/
__pycache__/

# coverage
_pytest-report/

# pytype
_pytype_output/

# mypy
.mypy_cache/
```

## go

```
# Binaries for programs and plugins
*.exe
*.dll
*.so
*.dylib
debug
```

## c / c++

```
# Prerequisites
*.d

# Object files
*.o
*.ko
*.obj
*.elf

# Linker output
*.ilk
*.map
*.exp

# Precompiled Headers
*.gch
*.pch

# Libraries
*.lib
*.a
*.la
*.lo

# Shared objects (inc. Windows DLLs)
*.dll
*.so
*.so.*
*.dylib

# Executables
*.exe
*.out
*.app
*.i*86
*.x86_64
*.hex

# Debug files
*.dSYM/
*.su
*.idb
*.pdb

# Kernel Module Compile Results
*.mod*
*.cmd
.tmp_versions/
modules.order
Module.symvers
Mkfile.old
dkms.conf

# compiled outout
.output/
```

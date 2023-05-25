# rbenv

```
brew install rbenv
```

```
eval "$(rbenv init -)";
```

Install `ruby-build` as an `rbenv` plugin. This provides an `rbenv install` command that simplifies the process of installing new Ruby versions:

```
brew install ruby-build
```

## install ruby version

```
rbenv install -l

rbenv install 3.2.2

rbenv versions
```

## set local ruby env

```
cd <dir>

rbenv local 3.2.2

ruby -v
```

## set global ruby env

```
rbenv global 3.2.2

ruby -v
```

## issue (version is not selected)

```
# Sometimes, rbenv needs to update its shims, particularly for newly installed Ruby binaries. You can do this with the following command:
$ Rehash rbenv

```

```sh
# Ensure rbenv is initialized in your shell.
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

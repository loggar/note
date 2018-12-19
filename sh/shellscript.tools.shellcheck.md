# Helpful tools for writing scripts

## Shellcheck

* https://www.shellcheck.net/
* https://github.com/koalaman/shellcheck

sample test shellscript code

``` shell
#! /usr/bin/env bash

cd $1
$path = $( pwd )
echo $path
```

Running this through Shellcheck gives us these errors:

```
$ shellcheck myscript
 
Line 3:
        cd $1
        ^-- SC2164: Use cd ... || exit in case cd fails.
           ^-- SC2086: Double quote to prevent globbing and word splitting.
 
Line 4:
        $path = $( pwd )
         ^-- SC1066: Don't use $ on the left side of assignments.
              ^-- SC1068: Don't put spaces around the = in assignments.
 
Line 5:
        echo $path
             ^-- SC2086: Double quote to prevent globbing and word splitting.
```

fix

``` shell
#! /usr/bin/env bash

cd "$1" || exit
path=$( pwd )
echo "$path"
```

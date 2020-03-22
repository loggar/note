# issues

## running a bash script

```
$ ./test.sh
-bash: ./replicate_sims_prod_to_dev.sh: /usr/bin/bash^M: bad interpreter: No such file or directory
```

I have seen this issue when creating scripts in Windows env and then porting over to run on a Unix environment.

### Resolve

#### dos2unix

```
yum install dos2unix
```

Convert from DOS default code page to Unix Latin-1:

```
dos2unix -iso -n in.txt out.txt
```

#### sed

All `.sh` files in current directory

```
sed -i 's/\r$//' ./*

sed -i 's/\r$//' ./*.sh
```

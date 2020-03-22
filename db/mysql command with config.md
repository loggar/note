# mysql command with config

when trying 

```shell
mysql -uroot -p'password' ...
```

emits this warning

```
Warning: Using a password on the command line interface can be insecure.
```

## solve

configure user info config file

for example, `config.cnf`

```
[client]
user=root
password=admin
host=localhost
```

and then

```
mysql --defaults-extra-file=/path/to/config.cnf

mysqldump --defaults-extra-file=/path/to/config.cnf 
```
create user, set privileges

```
use mysql;
create user 'springbook'@'localhost' identified by 'springbookpw';
GRANT ALL PRIVILEGES ON springbook.* TO 'springbook'@'localhost' with grant option;
select * from user;
 ```

apply new privileges

```
flush privileges; 
```


list privileges

```
show grants for 'springbook'@'localhost';
```

delete privileges

```
revoke all on samplespring.table from springbook@localhost;
```

delete user

```
drop user 'springbook'@'localhost';
```
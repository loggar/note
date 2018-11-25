user 생성 및 권한 설정

```
use mysql;
create user 'springbook'@'localhost' identified by 'springbookpw';
GRANT ALL PRIVILEGES ON springbook.* TO 'springbook'@'localhost' with grant option;
select * from user;
 ```

권한 적용

```
flush privileges; 
```


권한 보기

```
show grants for 'springbook'@'localhost';
```

권한 삭제

```
revoke all on samplespring.table from springbook@localhost;
```

user 삭제

```
drop user 'springbook'@'localhost';
```
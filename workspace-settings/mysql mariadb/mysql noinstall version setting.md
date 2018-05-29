```
(설치후 최초 1회 - console demon initialize)
파일 생성 C:\_dev\mysql\mysql-5.7.11-winx64\my.ini
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --initialize --console

[mysql console 실행 ]
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysqld --console

[mysql user interface 실행]
C:\_dev\mysql\mysql-5.7.11-winx64\bin\mysql -u root -p
Enter password: ************

[임시 비밀번호 변경 - 새로운 비밀번호를 등록해야 권한을 얻게 된다.(최초1회)]
ALTER USER 'root'@'localhost' IDENTIFIED BY 'admin'; FLUSH PRIVILEGES;
혹은
mysql> set password = password('testpass');

[이후의 사용은 mysql console 실행 후 사용하면 됨(데몬/서비스 구동과 동일한 효과)]
C:\_dev\mysql\mysql-5.7.11-winx64\bin>mysqld --console
```

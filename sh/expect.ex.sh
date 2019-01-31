#!/usr/bin/expect
spawn mysqldump -u root -p  db_name > ./filename.sql
expect "Password:"
send "password#1\n"
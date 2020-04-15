## flush-hosts

```
ER_HOST_IS_BLOCKED: Host '10.1.20.82' is blocked because of many connection errors; unblock with 'mysqladmin flush-hosts'
```

solve:

```
mysqladmin flush-hosts
```

or 

```
user@host:~$ mysql -uroot -p

mysql> flush hosts;
Query OK, 0 rows affected (0.00 sec)
```
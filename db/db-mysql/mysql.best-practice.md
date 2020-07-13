# Mysql best practices

## Do not use functions over indexed columns

```sql
SELECT columns FROM table WHERE customer_code like 'AK%'
```

and do not write

```sql
SELECT columns FROM table WHERE left (customer_code,2)='AK'
```

The first example will make use of the index, which will result in a faster response time.

## Use SQL SELECT \* only if needed

## Use ORDER BY clause only if needed

## Use EXISTS clause wherever needed

For checking the existence of data, use EXISTS clause which is faster in response time

```sql
If EXISTS(SELECT * from Table WHERE col='some value')
```

Do not use:

```sql
If (SELECT count(*) from Table WHERE col='some value')>0
```

## Use LIMIT 1 when getting a unique row

```php
// do I have anyusersfrom Alabama?

// what NOT to do:
$r = mysql_query("SELECT * FROM user WHERE state = 'Alabama'");
if (mysql_num_rows($r) > 0) {
// ...
}

// muchbetter:
$r = mysql_query("SELECT 1 FROM user WHERE state = 'Alabama' LIMIT 1");
if (mysql_num_rows($r) > 0) {
// ...
}
```

## Index and use the same column types for joins

```php
// looking for companies in my state
$r = mysql_query("SELECT company_name FROM users
LEFT JOIN companies ON (users.state = companies.state)
WHERE users.id = $user_id");

// both state columns should be indexed and they both should be the same type and character encoding or MySQL might do full table scans
```

## Hide MySQL from the Internet

## Use the smallest data types possible

## Take advantage of query caching

```php
// query cache does NOT work
$r = mysql_query("SELECT username FROM user WHERE signup_date >= CURDATE()");

// query cache works!
$today = date("Y-m-d");
$r = mysql_query("SELECT username FROM user WHERE signup_date >= '$today'");
```

The reason query cache does not work in the first line is the usage of the CURDATE() function. This applies to all non-deterministic functions like NOW() and RAND() etc... Since the return result of the function can change, MySQL decides to disable query caching for that query. All we needed to do is to add an extra line of PHP before the query to prevent this from happening.

### Setting the MySQL Server Query Cache

```
mysql> show variables like 'have_query_cache';
+------------------+-------+
| Variable_name    | Value |
+------------------+-------+
| have_query_cache | YES   |
+------------------+-------+
1 row in <b>set</b> (0.00 sec)
```

```
mysql> show variables like 'query_cache_%' ;
+------------------------------+----------+
| Variable_name                | Value    |
+------------------------------+----------+
| query_cache_limit            | 1048576  |
| query_cache_min_res_unit     | 4096     |
| query_cache_size             | 16777216 |
| query_cache_type             | OFF      |
| query_cache_wlock_invalidate | OFF      |
+------------------------------+----------+
5 rows in <b>set</b> (0.00 sec)
```

Mysql config file:

```
query_cache_type=1
query_cache_size =10M
query_cache_limit=256k
```

## Do not edit dump files

## Turn on delay_key_write

## Do Not ORDER BY RAND()

```php
// what NOT to do:
$r = mysql_query("SELECT username FROM user ORDER BY RAND() LIMIT 1");

// much better:
$r = mysql_query("SELECT count(*) FROM user");
$d = mysql_fetch_row($r);
$rand = mt_rand(0,$d[0] - 1);

$r = mysql_query("SELECT username FROM user LIMIT $rand, 1");
```

## Almost Always Have an id Field

## Use ENUM over VARCHAR

## Get Suggestions with PROCEDURE ANALYSE()

PROCEDURE ANALYSE() will let MySQL analyze the columns structures and the actual data in your table to come up with certain suggestions for you. It is only useful if there is actual data in your tables because that plays a big role in the decision making.

For example, if you created an INT field for your primary key, however do not have too many rows, it might suggest you to use a MEDIUMINT instead. Or if you are using a VARCHAR field, you might get a suggestion to convert it to ENUM, if there are only few unique values.

## Use NOT NULL If You Can

From MySQL docs:

```
"NULL columns require additional space in the row to record whether their values are NULL. For MyISAM tables, each NULL column takes one bit extra, rounded up to the nearest byte."
```

## Prepared Statements

There are multiple benefits to using prepared statements, both for performance and security reasons.

Prepared Statements will filter the variables you bind to them by default, which is great for protecting your application against SQL injection attacks. You can of course filter your variables manually too, but those methods are more prone to human error and forgetfulness by the programmer. This is less of an issue when using some kind of framework or ORM.

Since our focus is on performance, I should also mention the benefits in that area. These benefits are more significant when the same query is being used multiple times in your application. You can assign different values to the same prepared statement, yet MySQL will only have to parse it once.

Also latest versions of MySQL transmits prepared statements in a native binary form, which are more efficient and can also help reduce network delays.

There was a time when many programmers used to avoid prepared statements on purpose, for a single important reason. They were not being cached by the MySQL query cache. But since sometime around version 5.1, query caching is supported too.

To use prepared statements in PHP you check out the mysqli extension or use a database abstraction layer like PDO.

```php
// create a prepared statement
if ($stmt = $mysqli->prepare("SELECT username FROM user WHERE state=?")) {

    // bind parameters
    $stmt->bind_param("s", $state);

    // execute
    $stmt->execute();

    // bind result variables
    $stmt->bind_result($username);

    // fetch value
    $stmt->fetch();

    printf("%s is from %s\n", $username, $state);

    $stmt->close();
}
```

## Unbuffered Queries

Normally when you perform a query from a script, it will wait for the execution of that query to finish before it can continue. You can change that by using unbuffered queries.

There is a great explanation in the PHP docs for the mysql_unbuffered_query() function:

```
"mysql_unbuffered_query() sends the SQL query query to MySQL without automatically fetching and buffering the result rows as mysql_query() does. This saves a considerable amount of memory with SQL queries that produce large result sets, and you can start working on the result set immediately after the first row has been retrieved as you don't have to wait until the complete SQL query has been performed."
```

However, it comes with certain limitations. You have to either read all the rows or call mysql_free_result() before you can perform another query. Also you are not allowed to use mysql_num_rows() or mysql_data_seek() on the result set.

## Store IP Addresses as UNSIGNED INT

Many programmers will create a VARCHAR(15) field without realizing they can actually store IP addresses as integer values. With an INT you go down to only 4 bytes of space, and have a fixed size field instead.

You have to make sure your column is an UNSIGNED INT, because IP Addresses use the whole range of a 32 bit unsigned integer.

In your queries you can use the INET_ATON() to convert and IP to an integer, and INET_NTOA() for vice versa. There are also similar functions in PHP called ip2long() and long2ip().

```php
$r = "UPDATE users SET ip = INET_ATON('{$_SERVER['REMOTE_ADDR']}') WHERE user_id = $user_id";
```

## Fixed-length (Static) Tables are Faster

## Vertical Partitioning

Vertical Partitioning is the act of splitting your table structure in a vertical manner for optimization reasons.

Example 1: You might have a users table that contains home addresses, that do not get read often. You can choose to split your table and store the address info on a separate table. This way your main users table will shrink in size. As you know, smaller tables perform faster.

Example 2: You have a "last_login" field in your table. It updates every time a user logs in to the website. But every update on a table causes the query cache for that table to be flushed. You can put that field into another table to keep updates to your users table to a minimum.

But you also need to make sure you don't constantly need to join these 2 tables after the partitioning or you might actually suffer performance decline.

## Split the Big DELETE or INSERT Queries

## Take Advantage of MySQL Full-text Searches

If you are faced with a situation where you need to search data using wildcards and you don't want your database to underperform, you should consider using MySQL full-text search (FTS) because it is far much faster than queries using wildcard characters.

Furthermore, FTS can also bring better and relevant results when you are searching a huge database.

To add a full-text search index to the students sample table, we can use the below MySQL command:

```sql
Alter table students ADD FULLTEXT (first_name, last_name);

Select * from students where match(first_name, last_name) AGAINST ('Ade');
```

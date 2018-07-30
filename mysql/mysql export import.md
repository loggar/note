export 

```
mysqldump -u root -p --opt [database name] > [database name].sql
```

import 

```
mysql -u root -p newdatabase < /path/to/newdatabase.sql
```

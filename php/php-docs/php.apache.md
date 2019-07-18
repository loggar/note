# Configure PHP as an Apache module

Stop running Apache Windows:

```
net stop Apache2.2
```

`confhttpd.conf`

```
DirectoryIndex index.php index.html
```

```
# PHP5 module
LoadModule php5_module "c:/php/php5apache2_2.dll"
AddType application/x-httpd-php .php
PHPIniDir "C:/php"
```

test configuration

```
cd Apache2bin
httpd -t
```

Test a PHP file

`index.php`

```
<?php phpinfo(); ?>
```

```
http://localhost:80/
```

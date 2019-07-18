# php install

## windows

```
https://windows.php.net/download
```

downloaded file:

```
php-7.3.7-Win32-VC15-x86.zip
```

append php directory to windows path:

```
~/php/php-7.3.7-Win32-VC15-x86/
```

```
$ php -version
PHP 7.3.7 (cli) (built: Jul  3 2019 14:35:54) ( ZTS MSVC15 (Visual C++ 2017) x86 )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.7, Copyright (c) 1998-2018 Zend Technologies
```

### configure `php.ini`

```
extension_dir = "C:/php/ext"
```

Enable extensions. This will depend on the libraries you want to use, but the following extensions should be suitable for the majority of applications:

```
extension=curl
extension=gd2
extension=mbstring
extension=mysql
extension=pdo_mysql
extension=xmlrpc
```

If you want to send emails using the PHP `mail()` function, enter the details of an `SMTP` server (your ISP’s server should be suitable):

```
[mail function]
; For Win32 only.
SMTP = mail.myisp.com
smtp_port = 25

; For Win32 only.
sendmail_from = my@emailaddress.com
```

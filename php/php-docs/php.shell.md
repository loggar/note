# run php on shell

ref)

- https://www.php.net/manual/en/features.commandline.php

## run with arguments

`shell.prepend.args-to-array.php`

```
<?php

parse_str(implode('&', array_slice($argv, 1)), $_GET);

?>
```

This will set `$_GET['a']` to `'1'` and`$_GET['b']` to `array('2', '3')`.

Even better, instead of putting that line in every file, take advantage of PHP's auto_prepend_file directive. Put that line in its own file and set the auto_prepend_file directive in your cli-specific `php.ini` like so:

```
auto_prepend_file = "~/php/php-dir/shell.prepend.args-to-array.php"
```

It will be automatically prepended to any PHP file run from the command line.

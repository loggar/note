<?php
// $ php -f args.1.toarray.php a=1 b[]=2 b[]=3

parse_str(implode('&', array_slice($argv, 1)), $_GET);

print_r($_GET);

?>

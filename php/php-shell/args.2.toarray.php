<?php 
// php args.2.toarray.php --user=nobody --password=secret -p --access="host=127.0.0.1 port=456"

function arguments($argv) { 
    $_ARG = array(); 
    foreach ($argv as $arg) { 
      if (preg_match('--([^=]+)=(.*)',$arg,$reg)) { 
        $_ARG[$reg[1]] = $reg[2]; 
      } elseif(preg_match('^-([a-zA-Z0-9])',$arg,$reg)) { 
            $_ARG[$reg[1]] = 'true'; 
      } else { 
            $_ARG['input'][]=$arg; 
      } 
    } 
  return $_ARG; 
} 

print_r(arguments($argv)); 
?>
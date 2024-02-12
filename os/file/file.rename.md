# Rename Files in Linux

## mv

```
mv (option) filename1.ext filename2.ext
```

## rename

```
rename (option) 's/oldname/newname/' file1.ext file24.ext
```

The letter “s” stands for “substitute,” and it’s the main part of the regular expression. Single quotes around it are obligatory. Available options are:

- `-v` (verbose: prints the list of renamed files along with their new names)
- `-n` (“no action:” a test mode or simulation which only shows the files that will be changed without touching them)
- `-f` (a forced overwrite of the original files)

The `rename` command also accepts wildcards to rename multiple files of the same type, and it works on file extensions as well. For example, this would change all files with the extension .jpeg to .jpg:

```
rename 's/.jpeg/.jpg/' *
```

The wildcard symbol (\*) means that all files in the folder will be affected.

The regular expression also has its own options (modifiers): “g” (global; affects all occurrences of the expression), and “i” (performs case-insensitive substitution). They are written at the end of the expression just before the closing single quote and can be combined:

```
rename -n 's/DSC/photo/gi' *.jpg
```

This would apply to all .jpg files that contain “DSC,” “dSC,” and “dsc” – change that part of the filename to “photo.” However, because of the “-n” option, the command wouldn’t actually rename the files but just print them in the console window.

Substitution is not the only thing that this regular expression can do. There’s also translation – marked by the letter “y” – which can transform the filenames on a more complex level. It is most often used to change the filename case:

```
rename 'y/a-z/A-Z/' *.jpg
```

This would change the names of all .jpg files from lowercase to uppercase. To do it vice-versa, just switch the “oldname” and “newname” parts of the regular expression.

Using the `rename` command boils down to mixing a few basic patterns to achieve the desired result. Thanks to the “-n” option, the users will never have to put their files at risk (or their nerves at stake), since it offers a safe and useful preview of what the renamed files will look like.

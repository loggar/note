# replace string in files using sed

refs)

- https://vickylai.com/verbose/how-to-replace-a-string-in-a-dozen-old-blog-posts-with-one-sed-terminal-command/
- https://www.folkstalk.com/2012/01/sed-command-in-unix-examples.html

## Current directory, non-recursive

Non-recursive means sed won’t change files in any subdirectories of the current folder.

Run this command to search all the files in your current directory and replace a given string.

```
// to replace 'foo' with 'bar'
$ sed -i -- 's/foo/bar/g' *
```

Here’s what each component of the command does:

- `-i` will change the original, and stands for “in-place.”
- `s` is for substitute, so we can find and replace.
- `foo` is the string we’ll be taking away,
- `bar` is the string we’ll use instead today.
- `g` as in “global” means “all occurrences, please.”
- `*` denotes all file types. (No more rhymes. What a tease.)

You can limit the operation to one file type, such as txt, by using:

```
sed -i -- 's/foo/bar/g' *.txt
```

## Current directory and subdirectories, recursive

We can supplement sed with find to expand our scope to all the current folder’s subdirectories. This will include any hidden files.

```
find . -type f -exec sed -i 's/foo/bar/g' {} +
```

To ignore hidden files (such as `.git`) you can pass the negation modifier `-not -path '*/\.*'`.

```
find . -type f -not -path '*/\.*' -exec sed -i 's/foo/bar/g' {} +
```

This will exclude any file that has the string `/.` in its path.

Alternatively, you can limit the operation to file names that end in a certain extension, like Markdown:

```
find . -type f -name "*.md" -exec sed -i 's/foo/bar/g' {} +
```

## Working with URLs: change the separator

In the case of needing to update a URL, the `/` separator in your strings will need escaping. It ends up looking like this…

```
find . -type f -exec sed -i 's/https:\/\/www.oldurl.com\/blog/https:\/\/www.newurl.com\/blog/g' {} +
```

You can avoid some confusion and mistakes by changing the separator to any non-conflicting character. The character that follows the `s` will be treated as the separator. In our case, using a `,` or `_` would do. This doesn’t require escaping and is much more readable:

```
find . -type f -exec sed -i 's_https://www.oldurl.com/blog_https://www.newurl.com/blog_g' {} +
```

## Sed Command Examples

Replacing or substituting string

```
sed 's/unix/linux/' file.txt
```

Replacing the nth occurrence of a pattern in a line

```
sed 's/unix/linux/2' file.txt
```

Replacing all the occurrence of the pattern in a line.

```
sed 's/unix/linux/g' file.txt
```

Replacing from nth occurrence to all occurrences in a line.

```
sed 's/unix/linux/3g' file.txt
```

Changing the slash `/` delimiter

```
sed 's/http:\/\//www/' file.txt

sed 's_http://_www_' file.txt

sed 's|http://|www|' file.txt
```

Using `&` as the matched string

```
sed 's/unix/{&}/' file.txt

sed 's/unix/{&&}/' file.txt
```

Using `\1`,`\2` and so on to `\9`

```
sed 's/\(unix\)/\1\1/' file.txt

sed 's/\(unix\)\(linux\)/\2\1/' file.txt

sed 's/^\(.\)\(.\)\(.\)/\3\2\1/' file.txt
```

Duplicating the replaced line with `/p` flag

```
sed 's/unix/linux/p' file.txt
```

Printing only the replaced lines

```
sed -n 's/unix/linux/p' file.txt
```

Running multiple sed commands.

```
sed 's/unix/linux/' file.txt| sed 's/os/system/'

sed -e 's/unix/linux/' -e 's/os/system/' file.txt
```

Replacing string on a specific line number.

```
sed '3 s/unix/linux/' file.txt
```

Replacing string on a range of lines.

```
sed '1,3 s/unix/linux/' file.txt

sed '2,$ s/unix/linux/' file.txt
```

Replace on a lines which matches a pattern.

```
sed '/linux/ s/unix/centos/' file.txt
```

Deleting lines.

```
sed '2 d' file.txt

sed '5,$ d' file.txt
```

Duplicating lines

```
sed 'p' file.txt
```

Sed as grep command

```
grep 'unix' file.txt

sed -n '/unix/ p' file.txt
```

You can also make the sed command to work as grep `-v`, just by using the reversing the sed with NOT `!`.
The `!` here inverts the pattern match.

```
grep -v 'unix' file.txt

sed -n '/unix/ !p' file.txt
```

Add a line after a match.

```
sed '/unix/ a "Add a new line"' file.txt
```

Add a line before a match

```
sed '/unix/ i "Add a new line"' file.txt
```

Change a line

```
sed '/unix/ c "Change line"' file.txt
```

Transform like tr command:

The sed command can be used to convert the lower case letters to upper case letters by using the transform "y" option.

```
sed 'y/ul/UL/' file.txt
```

Here the sed command transforms the alphabets "ul" into their uppercase format "UL"

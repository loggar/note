# Unix Less Command: 10 Tips for Effective Navigation

* https://www.thegeekstuff.com/2010/02/unix-less-command-10-tips-for-effective-navigation

I personally prefer to use less command to view files (instead of opening the file to view in an editor). Less is similar to more command, but less allows both forward and backward movements. Moreover, less don’t require to load the whole file before viewing. Try opening a large log file in Vim editor and less — you’ll see the speed difference.

The navigation keys in less command are similar to Vim editor. In this article, let us look at few less command navigation and other operations which will make you a better command line warrior.

## Search Navigation

Once you’ve opened a log file (or any file) using less file-name, use the following keys to search. Please note that the match will be highlighted automatically by default.

### Forward Search

* `/` search for a pattern which will take you to the next occurrence.
* `n` for next match in forward
* `N` for previous match in backward

### Backward Search

* `?` search for a pattern which will take you to the previous occurrence.
* `n` for next match in backward direction
* `N` for previous match in forward direction

Tip: If you dont bother about which direction the search is happening, and you want to search file path, or URL, such as “/home/ramesh/”, you can use backward search (?pattern) which will be handy as you don’t want to escape slashes each time.

```
Search Path
In forward: /\/home\/ramesh\/
In backward: ?/home/ramesh/
```

## Screen Navigation

Use the following screen navigation commands while viewing large log files.

* `Ctrl+F` forward one window
* `Ctrl+B` backward one window
* `Ctrl+D` forward half window
* `Ctrl+U` backward half window

## Line navigation

In a smaller chunk of data, where you want to locate particular error, you may want to navigate line by line using these keys:

* `j` navigate forward by one line
* `k` navigate backward by one line

## Other Navigations

The following are other navigation operations that you can use inside the less pager.

* `G` go to the end of file
* `g` go to the start of file
* `q` or `ZZ` exit the less pager

## Simulate tail -f inside less pager – Press F

Once you’ve opened a file using less command, any content that is appended to the file after that will not be displayed automatically. However, you can press F less command will show the status ‘waiting for data‘. This is as similar to `tail -f`.

## Count magic

Similar to Vim editor navigation command, you can give 10j to scroll 10 lines down, or 10k to go up by 10 lines.

* `10j` 10 lines forward.
* `10k` 10 lines backward.
* `Ctrl+G` show the current file name along with line, byte and percentage statistics.

## Other useful Less Command Operations

* `v` using the configured editor edit the current file.
* `h` summary of less commands
* `&pattern` display only the matching lines, not all.

## Less Command – Marked navigation

When you are viewing a large log file using less command, you can mark a particular position and return back to that place again by using that mark.

* `ma` mark the current position with the letter `a`
* `'a` go to the marked position `a`

## Multiple file paging

You can open multiple files by passing the file names as arguments.

```
$ less file1 file2
```

While you are viewing file1, use :e to open the file2 as shown below.

```
$ less file1
:e file2
```

Navigation across files: When you opened more than two files ( for e.g – `less *` ), use the following keys to navigate between files.

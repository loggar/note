# windows newline -> unix newline format.

## All files in current directory

```
sed -i 's/\r$//' ./*

sed -i 's/\r$//' ./*.js
```

## Current directory and subdirectories, recursive

We can supplement sed with find to expand our scope to all the current folder’s subdirectories. This will include any hidden files.

```
find . -type f -exec sed -i 's/\r$//' {} +
```

To ignore hidden files (such as .git) you can pass the negation modifier `-not -path '*/\.*'`.

```
find . -type f -not -path '*/\.*' -exec sed -i 's/\r$//' {} +
```

This will exclude any file that has the string `/.` in its path.

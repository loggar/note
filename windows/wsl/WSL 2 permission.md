# wsl 2 permission issue

## dir/file permission regarding docker volumes

I had an issue with modify/delete files which are mounted to docker containers

I need the wsl root permission:

```
$ wsl -u root

# rm -rf <dir-you-want-to-delete>
```

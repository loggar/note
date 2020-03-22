# rsync

Here’s one for backing up a local directory to a local destination, such as an external hard drive:

```
rsync -a /home/user/directory /media/user/destination
```

## flags

```
Syncs files recursively through directories (r);
Preserves symlinks (l), permissions (p), modification times (t), groups (g), and owner (o); and
Copies device and special files (D).
```

Here’s another example, this time for backing up the contents of a local directory to a directory on a remote server using SSH:

```
rsync -avze ssh /home/user/directory/ user@remote.host.net:home/user/directory
```

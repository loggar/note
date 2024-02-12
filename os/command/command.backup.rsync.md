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

## Example

```
rsync [options] source [destination]

rsync local_file_path user@remote-host:remote_file_path

rsync user@remote-host:remote_file_path local_file_path
```

Recursive: If you add the -r option, RSync will execute a recursive file transfer. This is useful when working with directories. Here is an example:

```
rsync -r user@remote-host:remote_directory/ local_directory
```

Archive: The `-a` flag is used to preserve symbolic links while transferring files. The archive flag also preserves special and device files, modification times, and permissions from the source directory.

The archive flag also syncs files recursively, so it is used more than the recursive flag. Here is how you use it:

```
rsync -a user@remote-host:remote_directory/ local_directory
```

Compression

```
rsync -az user@remote-host:remote_directory/ local_directory
```

Progress

```
rsync -aP user@remote-host:remote_directory/ local_directory
```

Verbose

```
rsync -av user@remote-host:remote_directory/ local_directory
```

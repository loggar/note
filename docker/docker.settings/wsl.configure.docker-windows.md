# Configure WSL to Connect to Docker for Windows

configure WSL so that it knows how to connect to the remote Docker daemon running in Docker for Windows(remember, it’s listening on port 2375).

Connect to a remote Docker daemon with this 1 liner:

```sh
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
```

That just adds the export line to your `.bashrc` file so it’s available every time you open your terminal. The `source` commands reloads your bash configuration so you don’t have to open a new terminal right now for it to take effect.

## Verify Everything Works

```sh
# You should get a bunch of output about your Docker daemon.
# If you get a permission denied error, close + open your terminal and try again.
docker info

# You should get back your Docker Compose version.
docker-compose --version
```

# Ensure Volume Mounts Work

The last thing we need to do is set things up so that volume mounts work. This tripped me up for a while because check this out…

When using WSL, Docker for Windows expects you to supply your volume paths in a format that matches this: `/c/Users/nick/dev/myapp`.

But, WSL doesn’t work like that. Instead, it uses the `/mnt/c/Users/nick/dev/myapp` format. Honestly I think Docker should change their path to use /mnt/c because it’s more clear on what’s going on, but that’s a discussion for another time.

To get things to work for now, you have 2 options. If you’re running Windows 18.03 (Spring 2018) or newer you can configure WSL to mount at `/` instead of `/mnt` and you’re all done. If you’re running 17.09 (Fall 2017) you’ll need to do something else.

Here’s step by step instructions for both versions of Windows:

## Running Windows 10 18.03+ or Newer?

First up, open a WSL terminal because we need to run a few commands.

Create and modify the new WSL configuration file:

```sh
sudo nano /etc/wsl.conf
```

```conf
# /etc/wsl.conf
# Now make it look like this and save the file when you're done:
[automount]
root = /
options = "metadata"
```

We need to set `root = /` because this will make your drives mounted at `/c` or `/e` instead of `/mnt/c` or `/mnt/e`.

The `options = "metadata"` line is not necessary but it will fix folder and file permissions on WSL mounts so everything isn’t 777 all the time within the WSL mounts. I highly recommend you do this!

Once you make those changes, sign out and sign back in to Windows to ensure the changes take effect. `Win + L` isn’t enough. You’ll need to do a full blown sign out / sign in.

### If you get an error the next time you start your WSL terminal don’t freak out.

It’s a bug with 18.03 and you can easily fix it. Hit `CTRL + Shift + ECS` to open the task manager, goto the “Services” tab, find the “LxssManager” service and restart it.

This seems to only happen if you sign out of Windows instead of doing a full reboot and will likely be fixed in a future 18.03+ patch.

Once that’s done, you’re all set. You’ll be able to access your mounts and they will work perfectly with Docker and Docker Compose without any additional adjustments. For example you’ll be able to use `.:/myapp` in a `docker-compose.yml` file, etc..

### What terminal emulator are you using?

If you’re using ConEmu, then you’ll want to make sure to upgrade to the latest alpha release (at least 18.05.06+ which you can see in the title bar of the settings). It contains a patched `wslbridge.exe` file to support a custom WSL root mount point.

The default Ubuntu WSL terminal supports this by default, so you’re all good. I don’t know if other terminals support this yet. Let me know in the comments.

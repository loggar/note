# How to Run a Linux Program at Startup with systemd

We have a test script program `test-serv.sh`

```sh
#!/bin/bash

echo "test-serv.service: ## Starting ##" | systemd-cat -p info

while :
do
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
echo "test-serv.service: timestamp ${TIMESTAMP}" | systemd-cat -p info
sleep 60
done
```

copy to `/usr/local/bin`:

```
sudo cp test-serv.sh /usr/local/bin
```

we need to make it executable:

```
sudo chmod +x /usr/local/bin/test-serv.sh
```

## Creating the Service Unit File

```
sudo systemctl list-unit-files --type-service
```

Our service is going to be called test-serv.service”. No unit files have that name, so we can proceed and create our unit file.

`/etc/systemd/system/test-serv.service`

```
[Unit]
Description=How-To Geek Service Example

Wants=network.target
After=syslog.target network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/test-serv.sh
Restart=on-failure
RestartSec=10
KillMode=process

[Install]
WantedBy=multi-user.target
```

- Description: This is a text description of your service.
- Wants: Our service wants—but doesn’t require—the network to be up before our service is started.
- After: A list of unit names that should be started after this service has been successfully started, if they’re not already running.
- Type: Simple. systemd will consider this service started as soon as the process specified by ExecStart has been forked.
- ExecStart: The path to the process that should be started.
- Restart: When and if the service should be restarted. We have set it to “on-failure.”
- RestartSec: How long to wait before attempting to restart the service. This value is in seconds.
- KillMode: Defines how systemd should kill the process if we ask systemctl to stop the service. We have this set to “process.” This causes systemd to use the SIGTERM signal on the main process only. If our service was a non-trivial program instead of a simple script, we would set this to “mixed” to ensure that any spawned processes were also terminated.
- WantedBy: We have this set to “multi-user.target”, which means the service should be started as long as the system is in a state where multiple users can log in, whether or not a graphical user interface is available.

This command will give the owner read and write permissions, and read permissions to the group. Others will have no permissions:

```
sudo chmod 640 /etc/systemd/system/test-serv.service
```

We can have systemctl check the syntax of our unit file for us, even if the service isn’t running yet. Any errors will be reported. (Actually, the “.service” part is optional for most commands.)

```
systemctl status test-serv.service
```

## Starting the Service

```
sudo systemctl daemon-reload
```

If you want a service to be launched at startup you must enable it:

```
sudo systemctl enable test-serv

sudo systemctl start test-serv
```

## Verifying the Service

```
sudo systemctl status test-serv.service
```

```
$ systemctl status tomcat.service

$ systemctl status nginx.service

$ systemctl status sshd.service

$ systemctl status lighttpd.service
```

## Stopping and Disabling the Service

```
sudo systemctl stop test-serv.service
```

This stops the service, but it doesn’t prevent it from restarting next time the computer is rebooted. To stop the service being launched at startup, you need to disable it:

```
sudo systemctl disable test-serv.service
```

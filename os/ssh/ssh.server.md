# SSH for remote connection on Linux

## Activate SSH on host

Check if the relevant configuration files exist:

```
$ file /etc/ssh/ssh_config
/etc/ssh/ssh_config: ASCII text

$ file /etc/ssh/sshd_config
/etc/ssh/sshd_config: ASCII text

```

Install ssh server and client if not exist:

```
$ sudo dnf install openssh-clients openssh-server
```

Enable the SSH service (with systemd):

```
$ sudo systemctl enable --now sshd
```

## Start a secure shell

IP of the host:

```
$ ip addr show | grep "inet "
inet 127.0.0.1/8 scope host lo
inet 10.1.1.5/27 brd 10.1.1.31 [...]
```

Ping to host:

```
$ ping -c1 10.1.1.5
PING 10.1.1.5 (10.1.1.5) 56(84) bytes of data.
64 bytes from 10.1.1.5: icmp_seq=1 ttl=64 time=4.66 ms

$ ping -c1 hostname
PING 10.1.1.5 (10.1.1.5) 56(84) bytes of data.
```

Connect SSH from a remote client:

```
$ whoami
me

$ ssh username@10.1.1.5

bash$ whoami
username
```

## Create an SSH key

To create a new SSH key, use the ssh-keygen command:

```
$ ssh-keygen -t ed25519 -f ~/.ssh/lan
```

Get the public key over to your remote machine:

```
$ ssh-copy-id -i ~/.ssh/lan.pub username@10.1.1.5

password:
```

Connect SSH with key:

```
$ ssh -i ~/.ssh/lan username@10.1.1.5
bash$ whoami
username
```

Once you have passwordless authentication set up, you can edit the /etc/ssh/sshd_config file to disallow password authentication:

`/etc/ssh/sshd_config`

```
PasswordAuthentication no
```

Save it and restart SSH server:

```
$ sudo systemctl restart sshd && echo "OK"
OK
```

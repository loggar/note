# android ssh server

android app: SimpleSSHD

menu - reset keys

## ssh

client machine - ssh client
```
ssh <server ip> -p 2222
```

then simpleSSHD display single-use password.

## scp

```
scp -P 2222 /PATH/TO/LOCAL/FILE <server ip>:/data/user/0/org.galexander.sshd/files/FILE
```


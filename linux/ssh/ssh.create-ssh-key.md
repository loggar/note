# Create SSH key

Check to make sure you have not already created one in the past (for the system)

```
cd ~/.ssh

ls
```

Create SSH key

```
ssh-keygen -o
```

Add your private key to your system.

```
ssh-add /path/to/your/private.key
```

View your public key

```
cat id_rsa.pub
```

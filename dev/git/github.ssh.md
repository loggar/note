# git ssh and github

```
ls -al ~/.ssh
```

Create ssh:

```
$ ssh-keygen -t rsa -b 4096 -C "charly.loggar@gmail.com"
# Enter a file in which to save the key: /Users/charly.lee/.ssh/id_rsa_loggar
```

SSH-agent (optional):

```
# Start SSH-agent or check if it's already running in background:
$ eval "$(ssh-agent -s)"

# List the keys in SSH-agent:
$ ssh-add -l

# Add the new key to SSH-agent:
# ssh-add ~/.ssh/id_rsa_loggar

# To remove
$ ssh-add -d ~/.ssh/id_rsa_loggar

# For a single SSH operation, you can specify the key directly using the -i option with the ssh command, like so:
$ ssh -i ~/.ssh/id_rsa_loggar git@github.com
```

Set the pub key in Github account:

```
# copy pub key:
$ pbcopy < ~/.ssh/id_rsa_loggar.pub

# Go to GitHub and log into your account.
# Navigate to Settings > SSH and GPG keys > New SSH key.
# Paste your key into the "Key" field and give it a relevant title.
# Click "Add SSH key."
```

`~/.ssh/config`

```
# github loggar
Host github.com-loggar
  HostName github.com
  User git
  IdentityFile ~/.ssh/id_rsa_loggar
  IdentitiesOnly yes
```

Set git remote:

```
# if clone:
$ git clone git@github.com-loggar:loggar/<repository>.git

# if exist:
$ git remote set-url origin git@github.com-loggar:loggar/<repository>.git
```

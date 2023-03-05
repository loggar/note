# Gitlab CI/CD: Deploy on different servers

```
master → which needs to be deployed on Server1(100.100.100.1)
develop → which needs to be deployed on Server2(100.100.100.2)
```

```yml
stages:
  - deploy

deploy_to_production:
  stage: deploy
  environment:
    name: production
    url: 165.227.46.221
  before_script:
    - echo "Before script...."
    - echo $SSH_PRIVATE_KEY
    - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
    - eval $(ssh-agent -s)
    - ssh-add <(echo "$SSH_PRIVATE_KEY")
    - mkdir -p ~/.ssh
    - '[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config'
  script:
    - cd /var/www/html/my-project
    - git pull origin master
  only:
    - master
```

Using ssh-copy-id

`ssh-copy-id` is a utility available on some operating systems that can copy an SSH public key to a remote server over SSH.

1. On Server1(100.100.100.1) execute this command:`$ ssh-copy-id -i ~/.ssh/id_rsa.pub 100.100.100.2`
2. As an output, you will be asked to enter the password of Server2
3. Once you enter it correctly, it will give output message saying:

```
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/root/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
root@100.100.100.2's password:
Number of key(s) added: 1
Now try logging into the machine, with:   "ssh '100.100.100.2'"
and check to make sure that only the key(s) you wanted were added.
```

4. So from now on, you can access the Server2 from Server1 using the command: `$ ssh '100.100.100.2'` OR `$ ssh 100.100.100.2` without entering the password.

Now we just need to use this command in `.gitlab-ci.yml` file of `develop` branch

`.gitlab-ci.yml` for `develop` branch:

```yml
stages:
  - deploy

deploy_to_lance:
  stage: deploy
 
  environment:
    name: lance
    url: 165.227.186.188

  script:
    - uname -n
    - ssh root@165.227.186.188 "cd /var/www/html/my-project &&  git pull origin master && exit"
    - uname -n
  
  only:
    - develop
```

# Docker Tutorial
## Swarms

### Set up your swarm

* Create a cluster - Local VMs (with Oracle VirtualBox)
```
$ docker-machine create --driver virtualbox myvm1
Running pre-create checks...
Creating machine...
(myvm1) Copying C:\Users\webnl\.docker\machine\cache\boot2docker.iso to C:\Users\webnl\.docker\machine\machines\myvm1\boot2docker.iso...
(myvm1) Creating VirtualBox VM...
(myvm1) Creating SSH key...
(myvm1) Starting the VM...
(myvm1) Check network to re-create if needed...
(myvm1) Waiting for an IP...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Docker Toolbox\docker-machine.exe env myvm1

$ docker-machine create --driver virtualbox myvm2
Running pre-create checks...
Creating machine...
(myvm2) Copying C:\Users\webnl\.docker\machine\cache\boot2docker.iso to C:\Users\webnl\.docker\machine\machines\myvm2\boot2docker.iso...
(myvm2) Creating VirtualBox VM...
(myvm2) Creating SSH key...
(myvm2) Starting the VM...
(myvm2) Check network to re-create if needed...
(myvm2) Waiting for an IP...
Waiting for machine to be running, this may take a few minutes...
Detecting operating system of created instance...
Waiting for SSH to be available...
Detecting the provisioner...
Provisioning with boot2docker...
Copying certs to the local machine directory...
Copying certs to the remote machine...
Setting Docker configuration on the remote daemon...
Checking connection to Docker...
Docker is up and running!
To see how to connect your Docker Client to the Docker Engine running on this virtual machine, run: C:\Program Files\Docker Toolbox\docker-machine.exe env myvm2
```

* LIST THE VMS AND GET THEIR IP ADDRESSES
```
$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
default   *        virtualbox   Running   tcp://192.168.99.100:2376           v17.10.0-ce
myvm1     -        virtualbox   Running   tcp://192.168.99.101:2376           v17.11.0-ce
myvm2     -        virtualbox   Running   tcp://192.168.99.102:2376           v17.11.0-ce
```

* Initialize the Swarm
```
$ docker-machine ssh myvm1 "docker swarm init --advertise-addr 192.168.99.101"
Swarm initialized: current node (whbtookswttbg5iig67y34fqr) is now a manager.

To add a worker to this swarm, run the following command:

    docker swarm join --token SWMTKN-1-5pti3pxtd76hptuabyn4ialu2zbqzkomkhwe1559q925r4pbqu-2eytg6md95ijjt2jgvplbsa0a 192.168.99.101:2377

To add a manager to this swarm, run 'docker swarm join-token manager' and follow the instructions.
```
>Ports 2377 and 2376
- Always run docker swarm init and docker swarm join with port 2377 (the swarm management port), or no port at all and let it take the default.
- The machine IP addresses returned by docker-machine ls include port 2376, which is the Docker daemon port. Do not use this port or you may experience errors.

* Add Nodes
```
$ docker-machine ssh myvm2 "docker swarm join --token SWMTKN-1-5pti3pxtd76hptuabyn4ialu2zbqzkomkhwe1559q925r4pbqu-2eytg6md95ijjt2jgvplbsa0a 192.168.99.101:2377"
This node joined a swarm as a worker.

$ docker-machine ssh myvm1 "docker node ls"
ID                            HOSTNAME            STATUS              AVAILABILITY        MANAGER STATUS
whbtookswttbg5iig67y34fqr *   myvm1               Ready               Active              Leader
9fyckbn7vonxnq7x7l5snfbh2     myvm2               Ready               Active
```

### Deploy your app on the swarm cluster

* Configure a docker-machine shell to the swarm manager
```
$ docker-machine env myvm1
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.101:2376"
export DOCKER_CERT_PATH="C:\Users\webnl\.docker\machine\machines\myvm1"
export DOCKER_MACHINE_NAME="myvm1"
export COMPOSE_CONVERT_WINDOWS_PATHS="true"
# Run this command to configure your shell:
# eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env myvm1)
```
```
$ eval $(docker-machine env myvm1)

$ docker-machine ls
NAME      ACTIVE   DRIVER       STATE     URL                         SWARM   DOCKER        ERRORS
default   -        virtualbox   Running   tcp://192.168.99.100:2376           v17.10.0-ce
myvm1     *        virtualbox   Running   tcp://192.168.99.101:2376           v17.11.0-ce
myvm2     -        virtualbox   Running   tcp://192.168.99.102:2376           v17.11.0-ce
```

* Deploy the Service
```
$ docker stack deploy -c docker-compose.yml getstartedlab
Creating network getstartedlab_webnet
Creating service getstartedlab_web

$ docker stack ps getstartedlab
ID                  NAME                  IMAGE                      NODE                DESIRED STATE       CURRENT STATE             ERROR               PORTS
v0dqsskycpxp        getstartedlab_web.1   loggar/get-started:part2   myvm1               Running             Preparing 7 seconds ago
qd3wak73294k        getstartedlab_web.2   loggar/get-started:part2   myvm2               Running             Preparing 7 seconds ago
11tl3yij7w48        getstartedlab_web.3   loggar/get-started:part2   myvm1               Running             Preparing 7 seconds ago
hy6b1bjbnu86        getstartedlab_web.4   loggar/get-started:part2   myvm2               Running             Preparing 7 seconds ago
rd6j5x72hyky        getstartedlab_web.5   loggar/get-started:part2   myvm1               Running             Preparing 7 seconds ago
ue1hn97syeax        getstartedlab_web.6   loggar/get-started:part2   myvm2               Running             Preparing 7 seconds ago
```

* Accessing your cluster
```
$ curl -4 http://192.168.99.101
<h3>Hello World!</h3><b>Hostname:</b> 3ec74f9ac847<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.101
<h3>Hello World!</h3><b>Hostname:</b> c47139653066<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>

$ curl -4 http://192.168.99.101
<h3>Hello World!</h3><b>Hostname:</b> 2bd87fe97f10<br/><b>Visits:</b> <i>cannot connect to Redis, counter disabled</i>
```

### Iterating and scaling your app

* Change or Scale app
* Build the app
* Publish the image
* Deploy Stack again to deploy these changes.
```
$ docker stack deploy
```

### Cleanup and reboot

* Stacks and swarms
```
(stack)
$ docker stack rm getstartedlab
Removing service getstartedlab_web
Removing network getstartedlab_webnet

(remove swarm on the worker)
$ docker-machine ssh myvm2 "docker swarm leave"

(remove swarm on the manager)
$ docker-machine ssh myvm1 "docker swarm leave --force"
Node left the swarm.
```

* Unsetting docker-machine shell variable settings
```
$ eval $(docker-machine env -u)
```

### Summary

```
docker-machine create --driver virtualbox myvm1 # Create a VM (Mac, Win7, Linux)
docker-machine create -d hyperv --hyperv-virtual-switch "myswitch" myvm1 # Win10
docker-machine env myvm1                # View basic information about your node
docker-machine ssh myvm1 "docker node ls"         # List the nodes in your swarm
docker-machine ssh myvm1 "docker node inspect <node ID>"        # Inspect a node
docker-machine ssh myvm1 "docker swarm join-token -q worker"   # View join token
docker-machine ssh myvm1   # Open an SSH session with the VM; type "exit" to end
docker node ls                # View nodes in swarm (while logged on to manager)
docker-machine ssh myvm2 "docker swarm leave"  # Make the worker leave the swarm
docker-machine ssh myvm1 "docker swarm leave -f" # Make master leave, kill swarm
docker-machine ls # list VMs, asterisk shows which VM this shell is talking to
docker-machine start myvm1            # Start a VM that is currently not running
docker-machine env myvm1      # show environment variables and command for myvm1
eval $(docker-machine env myvm1)         # Mac command to connect shell to myvm1
& "C:\Program Files\Docker\Docker\Resources\bin\docker-machine.exe" env myvm1 | Invoke-Expression   # Windows command to connect shell to myvm1
docker stack deploy -c <file> <app>  # Deploy an app; command shell must be set to talk to manager (myvm1), uses local Compose file
docker-machine scp docker-compose.yml myvm1:~ # Copy file to node's home dir (only required if you use ssh to connect to manager and deploy the app)
docker-machine ssh myvm1 "docker stack deploy -c <file> <app>"   # Deploy an app using ssh (you must have first copied the Compose file to myvm1)
eval $(docker-machine env -u)     # Disconnect shell from VMs, use native docker
docker-machine stop $(docker-machine ls -q)               # Stop all running VMs
docker-machine rm $(docker-machine ls -q) # Delete all VMs and their disk images
```

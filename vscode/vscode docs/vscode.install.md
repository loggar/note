# vscode install

## Ubuntu

update the packages index and install the dependencies 

```
sudo apt update

sudo apt updatesudo apt install software-properties-common apt-transport-https wget
```

import the Microsoft GPG key

```
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
```

enable the Visual Studio Code repository

```
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
```

Once the repository is enabled, install the latest version of Visual Studio Code

```
sudo apt install code
```

start vscode

```
code
```

update vscode

```
sudo apt update

sudo apt upgrade
```
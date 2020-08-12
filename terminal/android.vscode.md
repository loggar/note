# android vscode

Install Termux,

Install Ubuntu:

```
pkg install wget openssl-tool proot -y && hash -r && wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Ubuntu/ubuntu.sh && bash ubuntu.sh

```

```
./start-ubuntu.sh

```

Install vscode:

```
wget https://github.com/cdr/code-server/releases/download/2.1698/code-server2.1698-vsc1.41.1-linux-arm64.tar.gz

tar -xvf ./code-server2.1698-vsc1.41.1-linux-arm64.tar.gz

cp ./code-server2.1698-vsc1.41.1-linux-arm64/code-server /bin
```

set a password in our environment variables:

```
export PASSWORD="mypass"

```

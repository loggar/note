# install openssl

## dependencies

```sh
sudo yum update

openssl version -a
```

The "Development tools" are a yum group, which is a predefined bundle of software that can be installed at once, instead of having to install each application separately. The Development tools will allow you to build and compile software from source code. Issue the command below to install:

```sh
sudo yum group install 'Development Tools'
```

Issue the following command below to install other necessary packages and libraries.

```sh
sudo yum install -y perl-core zlib-devel
```

## download openssl

```sh
cd /usr/local/src/

sudo wget https://www.openssl.org/source/openssl-1.1.1c.tar.gz

sudo tar -xf openssl-1.1.1c.tar.gz

cd openssl-1.1.1c
```

## install openssl

```sh
sudo ./config --prefix=/usr/local/ssl --openssldir=/usr/local/ssl shared zlib
```

Naviagate to the `/etc/ld.so.conf.d` directory and create a new configuration file `openssl-1.1.1c.conf`.

```
/usr/local/ssl/lib
```

```sh
cd /etc/ld.so.conf.d/

cat > openssl-1.1.1c.conf

/usr/local/ssl/lib

# Ctrl + D to save the file
```

Reload the dynamic link by issuing the command below:

```sh
sudo ldconfig -v
```

## configure OpenSSL Binary

In our final configuration, we are going to insert the binary of our new version of OpenSSL installed (located at `/usr/local/ssl/bin/openssl`) to replace the default openssl binary (located at `/usr/bin/openssl` or `/bin/openssl`).

```sh
# backup the default OpenSSL binary files.
sudo cp /usr/local/ssl/bin/openssl /usr/local/ssl/bin/openssl.backup
```

`/etc/profile.d/openssl.sh`

```
#Set OPENSSL_PATH
OPENSSL_PATH="/usr/local/ssl/bin"
export OPENSSL_PATH
PATH=$PATH:$OPENSSL_PATH
export PATH
```

Make the `openssl.sh` file executable by issuing and reload the OpenSSL environment and check the PATH bin directory using commands below:

```sh
sudo chmod +x /etc/profile.d/openssl.sh

source /etc/profile.d/openssl.sh

echo $PATH
```
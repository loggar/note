# Mkcert - Create SSL Certificates for Local Development on Linux

## Installing Golang

```sh
$ apt install golang
$ go version
go version go1.10.1 linux/amd64
```

setting up Go environment variable server-wide

```sh
$ cat /etc/profile.d/goenv.sh
export GOROOT=/usr/lib/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

$ source /etc/profile.d/goenv.sh
```

## Installing the Certutil

The Certificate Database tool or Certutil is a simple command-line utility that can create/modify certificate and their key databases. It can be specifically used to list, generate, modify, or delete certificates. It can be even used to create or change the password, generate new public/private key pairs. Furthermore, it displays the contents of the key database or deletes key pairs within the key database. In our Ubuntu server, we can install it by running this command below:

```sh
$ apt install libnss3-tools
```

## Installing Mkcert

```sh
$ wget https://github.com/FiloSottile/mkcert/archive/v1.0.0.tar.gz

$ cd mkcert-1.0.0/

$ make
```

Now we can copy this mkcert binary from installation folder to `/usr/bin/` folder to use it server-wide.

```
$ cd mkcert-1.0.0/bin/

$ cp mkcert /usr/bin/
```

Finally, we can generate our local CA to generate our certificates with this command:

```
$ mkcert -install

Created a new local CA at "/root/.local/share/mkcert"
The local CA is now installed in the system trust store!
```

Out root CA will be created and saved under the path `/root/.local/share/mkcert`. Usually, the CA certificate and its key are stored in an application data folder in the user home. The location can be also obtained by using the command `mkcert -CAROOT`.

```sh
$ mkcert -CAROOT
/root/.local/share/mkcert
```

## generate locally trusted development certificates

```sh
$ mkcert example.com '*.example.org' myapp.dev localhost 127.0.0.1 ::1
Using the local CA at "/root/.local/share/mkcert"

Created a new certificate valid for the following names
- "example.com"
- "*.example.org"
- "myapp.dev"
- "localhost"
- "127.0.0.1"
- "::1"

The certificate is at "./example.com+5.pem" and the key at "./example.com+5-key.pem"
```

As reported in this command execution, the generated locally trusted certificates are saved in the path from where we run this command. In my case, my certificates are created at `/root` itself. I just moved those files to `/etc/ssl` folder as below:

```sh
$ cp /root/example.com+5.pem /etc/ssl/certs/
$ cp /root/example.com+5-key.pem /etc/ssl/private/
```

## Enabling the certificates on Apache2

Our next step is to install our web server and enable SSL to use this locally trusted development certificates. I installed Apache2 and enabled SSL to make use of this.

```sh
$ apt install apache2
$ systemctl enable apache2
$ systemctl start apache2
```

Secondly, edit the default SSL file located at `/etc/apache2/sites-available/default-ssl.conf` with our locally generated SSL certificate and key details as below:

```conf
# /etc/apache2/sites-available/default-ssl.conf
SSLCertificateFile /etc/ssl/certs/example.com+5.pem
SSLCertificateKeyFile /etc/ssl/private/example.com+5-key.pem
```

Now you can enable SSL module and restart the Apache2 service to make these changes effective.

```sh
$ a2enmod ssl
$ a2ensite default-ssl.conf

Enabling site default-ssl.
To activate the new configuration, you need to run:
systemctl reload apache2

$ systemctl reload apache2
$ systemctl restart apache2
```

Finally, we can try browsing https://localhost to confirm it's working.

# HTTPS Keys and Certs

## ssl key generation

``` shell
$ mkdir ex-server
$ cd ex-server
$ openssl genrsa -des3 -passout pass:x -out server.pass.key 2048
```

``` shell
$ openssl rsa -passin pass:x -in server.pass.key -out server.key

writing RSA key
```

Get rid of RSA:

``` shell
$ rm server.pass.key
```

``` shell
$ openssl req -new -key server.key -out server.csr

You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:AU
State or Province Name (full name) [Some-State]:NSW
Locality Name (eg, city) []:Sydney
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Webnlog
Organizational Unit Name (eg, section) []:dev
Common Name (e.g. server FQDN or YOUR name) []:loggar
Email Address []:charly.loggar@gmail.com

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []: ***************
An optional company name []:
```

``` shell
$ openssl x509 -req -sha256 -days 365 -in server.csr -signkey server.key -out server.crt

Signature ok
subject=/C=AU/ST=NSW/L=Sydney/O=Webnlog/OU=dev/CN=loggar/emailAddress=charly.loggar@gmail.com
Getting Private key
```

At the end, you should have three SSL files:

* server.crt
* server.csr
* server.key

You'll be reading from server.key and server.crt in your server.

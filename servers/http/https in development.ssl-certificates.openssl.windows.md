# openssl/windows: Running local development server on https

## You will need OpenSSL to generate SSL certificate.

- https://www.openssl.org/
- http://slproweb.com/products/Win32OpenSSL.html

> Warning: don’t use version 1.1.0 or later, you’ll get this error during later stage: “problem creating object tsa_policy1=1.2.3.4.1”

Set environment variables

```sh
set RANDFILE=c:\demo\.rnd
set OPENSSL_CONF=<path-to-openssl-folder>\bin\openssl.cfg
```

## Generating SSL certificate

Firstly, there are two types of certificates: One being signed by a ‘Certificate Authority(CA)’ and the other one being ‘self-signed certificate’. A CA is a trusted source for an SSL certificate, and using a certificate from a CA allows your users to trust the identity of your website. In most cases, you would want to use a CA-signed certificate in a production environment, however for testing purpose, a self-signed certificate would be sufficient.

As we need to run local development server with https, a self-signed certificate would do just great in our case. To generate it, execute below commands:

Start OpenSSL by running below command in cmd:

```sh
<path-openssl-folder>\bin\openssl.exe
```

First we generate RSA key for our root CA and store it in file key.pem. If you want to password-protect this key, add option -des3.

```sh
genrsa -out key.pem
```

This command generates a Certificate Signing Request, which you could instead use to generate a CA-signed certificate.

```sh
req -new -key key.pem -out csr.pem
```

Next, we create our self-signed root CA certificate cert.pem; you’ll need to provide an identity for your root CA. The -x509 option is used for a self-signed certificate. You may specify the validity of your certificate by providing the number of days.

```sh
x509 -req -days 8888 -in csr.pem -signkey key.pem -out cert.pem
```

This will create key.pem, csr.pem and cert.pem file in the bin folder of your OpenSSL. You will only require cert.pem(The Certificate) & key.pem(The Private Key) for an SSL connection.

## Running local development server

Go to your project directory. Install npm module http-server in your project directory:

```sh
npm install --save-dev http-server
```

Copy cert.pem & key.pem to root of your project directory.

Run below command:

```sh
http-server --ssl -c-1 -p 8080 -a 127.0.0.1

Starting up http-server, serving ./ through https
Available on:
https://127.0.0.1:8080
Hit CTRL-C to stop the server
```

After this, hit the URL https://localhost:8080 and see the magic. You might need to approve a security warning from your browser before continuing.

> This is strictly for the local development purpose.

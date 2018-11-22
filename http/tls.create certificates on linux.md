# Create certificates on Linux

ref) https://blog.talpor.com/2015/07/ssltls-certificates-beginners-tutorial/

Creating certificates to be signed by a CA

1. Create a private key and a **Certificate Signing Request (CSR)**
2. Send the CSR to the CA, keep your private key secret at all times
3. Go through the validation process which will vary depending of the type of calidation that you are going for. You will receive a signed certificate at the end of the process
4. Place the certificate inside your server
5. Configure your application to use the new certificate. For Linux systems this usually means configuring Nginx/Apache2 to use the new certificate and key

This document will just cover step 1.

## Create a private key and its CSR on Linux

```
openssl req -nodes -newkey rsa:2048 -keyout example.key -out example.csr
```

* `openssl`: the commonly used program to do TLS related stuff in Linux
* `req`: openssl command to manage CSRs
* `-nodes`: set the passphrase of the private key to blank (private keys of TLS may have passphrases)
* `-newkey rsa:2048`: create a new key, make it RSA with 2048 bits (you may first create key and later feed it to this command as a file path)
* `keyout`: where to write the new key
* `out`: where to write the CSR

this command will prompt you for some information regarding the CSR, such as the domain (which is called common name), country, company etc. You can leave them all blank except for the common name.

If you want something more script-friendly you can use the `-subj` flag:

```
openssl req -nodes -newkey rsa:2048 -keyout example.key -out example.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com”
```

If you need to create a CSR from an existing key:

```
openssl req -new -key example.key -out example.csr
```

To create a private RSA key:

```
openssl genrsa -out example.key 2048
```

## Creating self-signed SSL/TLS certificates

To sign your own certificate you can either use an existing CSR and private key, or just create one from scratch.

To create a self-signed certificate from scratch you can use this oneliner:

```
openssl req -nodes -newkey rsa:2048 -keyout example.key -out example.crt -x509 -days 365
```

* `-x509`: write out a self signed certificate instead of a CSR (The technical name for TLS/SSL certificates is X.509 certificates)
* `-days`: how long will the certificate will be valid. For certificates made from April 1st 2015 onwards browsers do not accept certificates with a validity period spanning more than 39 months (3 years plus 3 months)

This command will prompt you for some information, if you’re looking for something without interactivity look up the `-subj` flag.

To create a self-signed certificate using an existing CSR and private key:

```
openssl x509 -req -in example.csr -signkey example.key -out example.crt -days 365
```

x509: openssl command to manage X.509 certificates (aka TLS/SSL certificates)

* `-in`: the CSR
* `-signkey`: the private key
* `-out`: where to write the certificate
* `-days`: see the previous command

## Intermediate certificates

One thing that might baffle you at first is that CAs sometimes give you many certificates. There are practical reasons for this, but the bottom line is that one of those is your certificate, and another one is a root certificate that corresponds to a private key that signed one of the other certificates, which in turn corresponds to a private key that signed another one, and so on and so forth, forming a chain that eventually signs your certificate.

These intermediate certificates are called, well, intermediate certificates (Hurra for imagination). What you have to do is simply concatenate the certificates in the correct order, beginning with the certificate for your domain, and ending with the root certificate.

To figure out the correct order check first if your CA provides instructions, or if they gave you an already bundled version of the certificates.

If not you can check the “Subject” and “Issuer” fields of each certificate. The “Subject” field contains an identifier of the entity associated with the certificate, the “Issuer” contains the identifier of the entity that signed it.

Certificates come encoded in base64, but the following command will decode them:

```
openssl x509 -in example.crt -text -noout
```

## Basic constraints

At this point, now that you know that certificates can be chained, you might have come up with a genius plan:

1. Get a very cheap certificate from a CA
2. Locally create a certificate that would be very expensive if it were signed by a CA
3. Use the private key of the cheap certificate to sign the expensive certificate that you created locally
4. Bring the greedy and evil CAs to their knees with your devious and genius stratagem

Well no, you cannot do that: certificates have a field that determines whether or not its private key can sign other certificates (Extensions -> Basic Constraints -> CA: FALSE), and you cannot change this field in the certificate that the CA gives your because it would ruin the signature (recall that the signature is a hash of the certificate contents encrypted with the private key of the CA).


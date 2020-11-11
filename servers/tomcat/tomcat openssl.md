# Tomcat SSL/TLS (openssl)

```sh
cd /opt/certs

openssl genrsa -aes256 -out rootca_private.key 2048

# Enter pass phrase for rootca_private.key:
# tomcat#1

# create public key with the private key
openssl rsa -in rootca_private.key -out rootca_public_key.pem -pubout

```

## Create Custom `csr` file to request certificate Self-Certificate-Authority

```
$ openssl req -new -key rootca_private.key -out rootca.csr

Enter pass phrase for rootca_private.key:
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
Organization Name (eg, company) [Internet Widgits Pty Ltd]:ORG-NM
Organizational Unit Name (eg, section) []:IT
Common Name (e.g. server FQDN or YOUR name) []:Charly LEE
Email Address []:charly.lee@your-domain

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:

[root@84697b6b23b4 certs]# ls
rootca.csr  rootca_private.key  rootca_public_key.pem
```

## Create 10-year self-signed Chain (Root) certificate:

```
$ openssl x509 -req -days 3650 -extensions v3_ca -set_serial 1 -in rootca.csr -signkey rootca_private.key -out rootca.crt

Signature ok
subject=C = AU, ST = NSW, L = Sydney, O = ORG-NM, OU = IT, CN = Charly LEE, emailAddress = charly.lee@your-domain
Getting Private key
Enter pass phrase for rootca_private.key:
[root@84697b6b23b4 certs]# ls
rootca.crt  rootca.csr  rootca_private.key  rootca_public_key.pem
```

Check the certificate:

```
openssl x509 -text -in rootca.crt
```

## Create private key for web server

```sh
$ openssl genrsa -aes256 -out localhost_private.key 2048

# Enter pass phrase for localhost_private.key:
# tomcat1
```

Create local certificate:

```
$ openssl req -new -key localhost_private.key -out localhost.csr

Enter pass phrase for localhost_private.key:
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
Organization Name (eg, company) [Internet Widgits Pty Ltd]:ORG-NM
Organizational Unit Name (eg, section) []:IT
Common Name (e.g. server FQDN or YOUR name) []:Charly LEE
Email Address []:charly.lee@your-domain

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

## Create 5-year localhost certificate:

```sh
openssl x509 -req -days 1825 -extensions v3_user -in localhost.csr -CA rootca.crt -CAcreateserial -CAkey rootca_private.key -out localhost.crt
```

See `localhost.crt`

```sh
$ ls
localhost.crt  localhost.csr  localhost_private.key  rootca.crt  rootca.csr  rootca_private.key  rootca_public_key.pem  rootca.srl
```

## Tomcat keystore

```
$ openssl pkcs12 -export -in localhost.crt -inkey localhost_private.key -out keystore -name "localhost cert"

# Enter pass phrase for localhost_private.key:
# tomcat#1
# Enter Export Password:
# tomcat#1
# Verifying - Enter Export Password:
# tomcat#1
```

## Tomcat Connector

`server.xml`

```xml
<Connector port="80" protocol="HTTP/1.1"
               connectionTimeout="20000"
               redirectPort="8443" />

<Connector port="8443" protocol="org.apache.coyote.http11.Http11Protocol"
           maxThreads="150" SSLEnabled="true" scheme="https" secure="true"
           keystoreFile="/opt/certs/keystore" keystorePass="tomcat#1"
           clientAuth="false" sslProtocol="TLS" />

```

And web application context `web.xml`

```xml
<security-constraint>
  <web-resource-collection>
    <web-resource-name>Automatic Forward to HTTPS/SSL</web-resource-name>
    <url-pattern>/*</url-pattern>
  </web-resource-collection>
  <user-data-constraint>
    <transport-guarantee>CONFIDENTIAL</transport-guarantee>
  </user-data-constraint>
</security-constraint>
```

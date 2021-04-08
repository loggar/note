https://gist.github.com/Kmaschta/205a67e42421e779edd3530a0efe5945#file-generate-self-signed-certificate-with-custom-ca-md

If you're using self-signed certificate for your web server on development,
you might know the browser warning saying that your certificate isn't valid.
If like me you had manually added an exception for this certificate error each time it showed up, this gist is for you.


# Properly Configure OpenSSL with your DNS aliases

You'll have to [create a self-signed certificate with a custom SubjectAltName](https://stackoverflow.com/a/21494483/3868326).

1. Find your openssl config. `find /usr/lib -name openssl.cnf`
2. To the end of the file, add the following:

```ini
[ alternate_names ]

DNS.1        = example.com
DNS.2        = www.example.com
DNS.3        = mail.example.com
DNS.4        = ftp.example.com
; And so on...
```

3. Find the `v3_ca` section and add the following instruction:

```ini
subjectAltName = @alternate_names
```

4. Check that the `keyUsage` instruction contains `digitalSignature` and `keyEncipherment`.
5. Be sure that the following rule isn't commented `copy_extensions = copy`.

# Generate A Self-Signed Certificate & Related Custom Certificate Authority

```bash
# Generate the self-signed certificate and its key
$ openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout server.key -out server.crt
Generating a 2048 bit RSA private key
..................................+++
....................................................................................................................................................+++
writing new private key to 'server.key'
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:FR
State or Province Name (full name) [Some-State]:France
Locality Name (eg, city) []:Nancy
Organization Name (eg, company) [Internet Widgits Pty Ltd]:Example Co.
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:example.com
Email Address []:kevin@marmelab.com

# Create a custom certificate authority based on the certificate (hackish but it works)
$ cat server.key server.crt custom-ca.crt
```

# Add The Custom Certificate Authority To Your Browser

You must add the `custom-ca.crt` Certificate Authority file as a trusted CA in your browser:

### Chrome / Chromium

1. Go to `chrome://settings/certificates`
2. Open the `Authorities` tab and click on `Import`
3. Select the file in `custom-ca.crt`
4. Check `Trust this certificate to identify websites`

You can now navigate on `*.example.com` domains  with a valid certificate.

### Firefox

Firefox doesn't allow to add a self-signed certificate authority, but you can add a permanent exception to all self-signed certificates:

1. Go to https://example.Com (you'll have a security warning)
2. Click on the `Advanced` button
3. Click on the `Add Exception` button
4. Check `Permanently store this exception` and confirm

You may have to do the same with all the other domains, where the assets are served.


Profit. You can use your self-signed certificate (`server.crt` / `server.key`) on your local environment without having to adding an exception each time.
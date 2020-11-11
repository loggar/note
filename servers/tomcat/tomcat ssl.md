# Tomcat Web Server: SSL Certificate Installation

## The keystore

SSL certificate will work only with the same Keystore, which was created during the CSR generation process. Also, make sure to install all certificate files in the correct order on the Keystore.

We can download and extract the ssl certificate, or create a keystore file using Java.

### Creating a Keystore file using Java

```
$JAVA_HOME/bin/keytool -genkey -alias [youralias] -keyalg RSA -keystore [/preferred/keystore/path]

$JAVA_HOME/bin/keytool -genkey -alias tomcat -keyalg RSA -keystore /opt/apache-tomcat-ssl/keystore
```

## Creating the Certificate Signing Request

```
$JAVA_HOME/bin/keytool -certreq -keyalg RSA -alias [youralias] -file [yourcertificatname].csr -keystore [path/to/your/keystore]

$JAVA_HOME/bin/keytool -certreq -keyalg RSA -alias tomcat -file certi.csr -keystore /opt/apache-tomcat-ssl/keystore
```

## Importing the Certificate

Download a Chain (Root) Certificate from the Certificate Authority you obtained the Certificate from.

```
keytool -import -alias root -keystore <your_keystore_filename> -trustcacerts -file <filename_of_the_chain_certificate>

```

```
keytool -import -alias tomcat -keystore <your_keystore_filename> -file <your_certificate_filename>
```

## tomcat

`server.xml`

```
<connetcor port="8443" scheme="https" secure="true" SSLEnabled="true"
	SSL CertificateFile+'/path/to/your/certificate.crt"
	SSLCertificateKeyFile="/path/to/your/keyfile"
	SSLPassword="YourKeystorePassword"
	SSLCertificateChaineFile="path/to/your/root/certificate" KeyaAlias="yourAlias"
	SSLProtocoal="TLSv1"/>
```

Webapp `web.xml`

```
<security-constraint>
	<web-resource-collection>
	<web-resource-name> yourAppsName</web-resource-name>
	<url-pattern>/#<Url-pattern>
	</web-resource-collection>
	<transport-guarantee>CONFIDENTIAL</transport-guarantee>
	</user-data-constraint>
</security-constraint>
```




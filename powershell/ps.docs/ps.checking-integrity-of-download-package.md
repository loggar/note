# powershell

## Checking the Integrity of Downloaded Packages

Go to https://www.jetbrains.com/webstorm/download/download-thanks.html and download the WebStorm installer. You'll use it as an example of how to verify the integrity of a file.

In the download page, JetBrains suggests to:

> Download and verify the file SHA-256 checksum.

Clicking on the SHA-256 checksum link opens a basic page that shows the following output:

```
62196e17f1965c97d2c32bf30fadaf7935168933de6ecf23483acfc8bd4a90c6 *WebStorm-2018.3.5.exe
```

This checksum can help you determine that the file you downloaded hasn't been tampered by anyone during transmission and it's the file JetBrains intended for you to download.

Once the file is downloaded, you can make the Downloads folder your current directory and issue the following command to compute the hash of the downloaded file:

```
certutil -hashfile .\WebStorm-2018.3.5.exe SHA256
```

`Certutil.exe` is a CLI tool used to verify certificates, key pairs, and certificate chains.

Upon completion, the command prints the following to the screen:

```
SHA256 hash of .\WebStorm-2018.3.5.exe:
62196e17f1965c97d2c32bf30fadaf7935168933de6ecf23483acfc8bd4a90c6
CertUtil: -hashfile command completed successfully.
```

You can then compare this output with the checksum provided by JetBrains on their site. If the file name and the hash match perfectly, you can be assured that you downloaded the right file.


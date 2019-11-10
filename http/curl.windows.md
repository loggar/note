## curl for windows

### git for windows

If you install Git for Windows you get Curl automatically too. There are some advantages:
* Git takes care of the PATH setup during installation automatically.
* You get the GNU bash, a really powerful shell, in my opinion much better than the native Windows console.
* You get many other useful Linux tools like tail, cat, grep, gzip, pdftotext, less, sort, tar, vim and even Perl.

windows cmd

```
C:\Users\webnl>where curl
C:\Windows\System32\curl.exe
```

git bash

```
λ where curl
C:\Windows\System32\curl.exe
C:\_dev\git\usr\bin\curl.exe
```

### curl executable

* https://curl.haxx.se/download.html

How to setup cURL:
* Download and unzip 64-bit cURL with SSL.
* Copy the curl.exe file into your Windows PATH folder. By default, this is C:\Windows\System32
* Download and install the Visual Studio 2010 C++ Runtime Redistributable 64 bit
* Download the latest bundle of Certficate Authority Public Keys from mozilla.org
* Rename this file from cacert.pem to curl-ca-bundle.crt
* Move this file into your Windows PATH folder

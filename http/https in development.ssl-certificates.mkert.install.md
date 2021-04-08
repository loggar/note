# mkcert

https://github.com/FiloSottile/mkcert

## Installation

### macOS

On macOS, use Homebrew

```
brew install mkcert
brew install nss # if you use Firefox
```

or MacPorts.

```
sudo port selfupdate
sudo port install mkcert
sudo port install nss # if you use Firefox
```

### linux

On Linux, first install certutil.

```
sudo apt install libnss3-tools
    -or-
sudo yum install nss-tools
    -or-
sudo pacman -S nss
```

Then you can install using Linuxbrew

```
brew install mkcert
```

or build from source (requires Go 1.10+)

```
go get -u github.com/FiloSottile/mkcert
$(go env GOPATH)/bin/mkcert
```

or use the pre-built binaries.

For Arch Linux users, mkcert is available from AUR as mkcert or mkcert-git.

```
git clone https://aur.archlinux.org/mkcert.git
cd mkcert
makepkg -si
```

### windows

On Windows, use Chocolatey

```
PS C:\users\webnl> choco install mkcert

Chocolatey v0.10.11
Installing the following packages:
mkcert
By installing you accept licenses for the packages.
Progress: Downloading mkcert 1.3.0... 100%

mkcert v1.3.0 [Approved]
mkcert package files install completed. Performing other installation steps.
 ShimGen has successfully created a shim for mkcert.exe
 The install of mkcert was successful.
  Software install location not explicitly set, could be in package or
  default install location if installer.

Chocolatey installed 1/1 packages.
 See the log for details (C:\ProgramData\chocolatey\logs\chocolatey.log).
```

or use Scoop

```
scoop bucket add extras
scoop install mkcert
```

## Supported root stores

mkcert supports the following root stores:

* macOS system store
* Windows system store
* Linux variants that provide either
  * `update-ca-trust` (Fedora, RHEL, CentOS) or
  * `update-ca-certificates` (Ubuntu, Debian) or
  * `trust` (Arch)
* Firefox (macOS and Linux only)
* Chrome and Chromium
* Java (when `JAVA_HOME` is set)

To only install the local root CA into a subset of them, you can set the `TRUST_STORES` environment variable to a comma-separated list. Options are: "system", "java" and "nss" (includes Firefox).

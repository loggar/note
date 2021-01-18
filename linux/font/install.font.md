# Install `font`

## CentOS

`microsoft true font (msttcorefont)`

```
fc-list : file
```

```
yum install curl cabextract xorg-x11-font-utils fontconfig
yum install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm
```

```
fc-list : file

fc-cache -fv
```
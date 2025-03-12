# git install

## centos 7

```
sudo yum remove git*
```

### Install git

```
# sudo yum install git
```

```
# git --version
git version 1.8.3.1
```

```
git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"
git config --list
```

### Add IUS CentOS 7 repo

Add IUS CentOS 7 repo

```
sudo yum -y install  https://centos7.iuscommunity.org/ius-release.rpm
sudo yum -y install  git2u-all
```

```
$ git --version
git version 2.16.5
```

### Install the latest git from source

Dependencies

```
sudo yum groupinstall "Development Tools"
sudo yum -y install wget perl-CPAN gettext-devel perl-devel  openssl-devel  zlib-devel
```

Download and Install

```
export VER="2.22.0"
wget https://github.com/git/git/archive/v${VER}.tar.gz
tar -xvf v${VER}.tar.gz
rm -f v${VER}.tar.gz
cd git-*
sudo make install
```

```
$ git --version
git version 2.22.0
```

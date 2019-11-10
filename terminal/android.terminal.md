# Termux

android terminal emulator and linux environment app.

* https://termux.com/

```
$ apt update && apt upgrade
```

```
$ apt install git

$ apt install openssh
```

Notice that by default, Termux stores the `$HOME` folder into the application's private storage, the one provided by Android application sandbox and which by design is unique and only accessible to the app itself (expect for root and system user's of course). This is a good thing because it means your SSH keys won't be accessible to applications outside Termux.

## TUNE TERMUX

Using a command line with a touchscreen as input is not easy but Termux has some built-in features that make the experience better. While on Termux, `Volume-Down` acts as the `CTRL` key and `Volume-Up` is used for special keys. Touch `Volume-Up+Q` on your virtual-keyboard to make Termux display a row on top of the keyboard that has practical shortcuts for commonly used keys.

Also, you might notice that basic command line tools you've come to expect from a Linux environment are somewhat 'defective'. For example, in many Android devices this parameterized command `ls -la` will not be recognized as a valid one. You can fix this by installing the coreutils package:

Termux comes with a minimal base system, so you should also install ‘coreutils’ for the full-fledged variants of base CLI utilities such as ‘mv’, ‘ls’, etc.

```
$ apt install coreutils
```

## Storage

There are three main types of storage in Termux:

1. App-private storage: This is right where you are when you start Termux.
2. Shared internal storage: Storage in the device available to all apps.
3. External storage: Storage on external SD cards.

Although the environment setup in Termux is similar to that of a modern Linux distribution, running on Android implies differences and so far I have only managed to run Node.js fully while storing my data in Termux’s private storage (option 1 above).

So let’s create a directory for our app and change to this directory:

```
$ mkdir test-node && cd test-node
```

## EXTERNAL STORAGE SUPPORT

If you want a cloned repository to be accessible by other Android applications, so you can edit or view the files externally, you'll want to clone them to the external storage. This used to be the sdcard on older versions of Android, but nowadays it is usually just a separate partition on the device that is accessible by any application that has been given external storage permissions. On the new Android phones that support sdcards you'll basically have more than 1 external storage. So don't worry if you don't have an actual sdcard as you'll always have an external storage within your device.

You should configure the external storage for usage with Termux by issuing the following command:

```
$ termux-setup-storage
```

> On newer versions of Android you'll be asked to give the application access to your external-storage, which is expected.

This is create a directory on your $HOME directory with the name `storage`, which is a symlink to the external storage directory. The storage directory will in turn contain several sub-directories that serve various different purposes, the one we'll be using is `storage/shared` which is the root of your device's external directory, the same one that can be accessed by other Android applications.

## COPY SSH KEYS

The directory `.ssh` on your Termux's Home was created automatically when you installed the `openssh` package. Now you should copy your ssh keys to that directory. In my case I had adb with root permission, so I've simply copied my keys via adb. I've written 2 different methods below, use the one that fits you best.

```
/data/data/com.termux/files/usr/etc/ssh
```

### ADB ROOT METHOD

If you've root on your device, you may start `adb` as root like this:

```
$  adb root
restarting adbd as root
```

You're then able to copy your keys directly to the secure `.ssh` on the Termux home directory this way:

```
$ cd ~/.ssh
$ adb push id_rsa /data/data/com.termux/files/home/.ssh/
$ adb push id_rsa.pub /data/data/com.termux/files/home/.ssh/
```

### MANUAL COPY METHOD

If you cannot start adbd as root then an alternative is to copy the files to your sdcard and then from Termux move them from the sdcard to the `.ssh` directory. This is the basic procedure:

1. Copy your keys to your device's sdcard. You can use MTP for file transfer or use adb.
2. Open Termux, and navigate to `/sdcard/` as you normally would on the command line.
3. Use mv to move the files to `/data/data/com.termux/files/home/.ssh/`
4. Make sure you didn't leave any keys on the sdcard after you've confirmed that the keys were successfully copied to `.ssh`. Read Secure your keys below to know why you should be careful with this.

SECURE YOUR KEYS:

After copying the keys to the `.ssh` directory erase any trace of them from your external storage. Do NOT leave your ssh keys on the external storage of your phone! This would make it easy for them to be read and therefore stolen by any application on your Android phone that have the permission to read external storage. Even if you trust that you've installed only trustful applications, one of those applications might get hijacked and the attacker would get the same permissions as the hijacked application has (applications like your browser and social network apps are usual targets for this type of attack).

## TEST IT OUT

You can test if your ssh keys are working properly by cloning a private repository that you've assigned that key. Remember that on Termux the `home` directory is on accessible to Termux alone, so if you want to use the files of a repository with other applications installed on your Android device clone to `/storage/shared` instead which is a symlink to the root of your device's external storage.

I recommend that you check-out Termux web-page and learn more about it, and while you're at it think about donating to help the project's developers continue their good work.

## SSH INTO YOUR TERMUX

Termux help page has a very good entry on the subject of running [a openssh server on Termux](https://termux.com/ssh.html)

## INSTALL TIG

Tig is an ncurses-based text-mode interface for git. It makes it easier to browse a git repository, therefore defeating the need for a dedicated Android application for this purpose. When using it note that on Termux you can emulate the keyboard arrow keys for navigating ncurses by simply swiping on the screen in the same direction of the arrow key you're trying to use. To install tig:

```
$ apt install tig
```

## Node

```
apt install nodejs
```

get a source-code

```
git clone <url> <dirname>
```

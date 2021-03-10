# group and user

## useradd – create a new user or update default new user information.

To add a new user named james

```
useradd -m james
```

To set a password for the new user, use:

```
passwd james
```

## finger

The finger command gives you a short dump of information about a user, including the time of the user’s last login, the user’s home directory, and the user account’s full name.

```
finger loggar
```

## list groups of a user

```
groups loggar
```

## list all currently logged-in users

```
w
```


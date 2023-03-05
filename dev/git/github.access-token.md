# github access token

User - Settings - Developer settings - Personal access tokens

- token name
- expiry date
- access types

Generate token and use it as github password for access github API.

## Access

push to upstream using access token:

```
git push https://<ACCESS_TOCKEN>@github.com/loggar/note.git
```

set token as a project origin authentication:

```
git remote set-url origin https://<username>:<token>@github.com/<username>/<repository>.git
```

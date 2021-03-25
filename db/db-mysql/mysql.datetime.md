## Set date time (Ubuntu)

Linux:

```
dpkg-reconfigure tzdata
```

MariaDB Client:

```
SET GLOBAL time_zone = 'Australia/Sydney';
```

Application Jdbc connection:

```
jdbc.sims.url=jdbc:mysql://localhost:33301/KOI_SIMS_LOCAL?useLegacyDatetimeCode=false&serverTimezone=UTC
```

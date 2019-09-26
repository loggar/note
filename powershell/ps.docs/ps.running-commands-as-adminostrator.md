# powershell

## Running Commands as Administrator

You can manually start PowerShell as administrator by right-clicking on its desktop entry and choosing "Run as Administrator" or selecting that from its right menu options. That action opens a console that has elevated access and permissions.

However, you can also start an elevated console through a command in PowerShell:

```
Start-Process powershell -Verb runAs <process>
```

This command starts a process with the `runAs` verb, which in turn starts the process with permissions of a system admin.

For example, to start PowerShell as an administrator you can run the following command:

```
Start-Process -FilePath "powershell" -Verb RunAs
```

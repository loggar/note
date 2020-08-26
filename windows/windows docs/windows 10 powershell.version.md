# powershell version

```
PS C:\users\webnl> get-host

Name             : Visual Studio Code Host
Version          : 1.11.0
InstanceId       : 3dd7ae0a-2048-4cef-88b9-ad74843eb735
UI               : System.Management.Automation.Internal.Host.InternalHostUserInterface
CurrentCulture   : en-US
CurrentUICulture : en-US
PrivateData      : Microsoft.PowerShell.EditorServices.EditorServicesPSHost+ConsoleColorProxy
DebuggerEnabled  : True
IsRunspacePushed : False
Runspace         : System.Management.Automation.Runspaces.LocalRunspace
```

```
PS C:\users\webnl> $PSVersionTable

Name                           Value
----                           -----
PSVersion                      5.1.17134.407
PSEdition                      Desktop
PSCompatibleVersions           {1.0, 2.0, 3.0, 4.0...}
BuildVersion                   10.0.17134.407
CLRVersion                     4.0.30319.42000
WSManStackVersion              3.0
PSRemotingProtocolVersion      2.3
SerializationVersion           1.1.0.1
```

```
PS C:\users\webnl> $PSVersionTable.PSVersion

Major  Minor  Build  Revision
-----  -----  -----  --------
5      1      17134  407
```

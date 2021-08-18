# powershell env variables

show env variables

```
echo $env:Path
```

NODE_ENV

```
$Env:NODE_ENV = 'production'

$Env:NODE_ENV = 'production'; node app.js
```

JAVA_HOME

```powershell
> $Env:JAVA_HOME = "C:\_dev\Java\ms-jdk-16.0.1+9"

> echo $env:JAVA_HOME
> Get-ChildItem Env:JAVA_HOME

```

NODE PATH (append)

```
$env:Path += ";C:\_dev\nodejs\node-v14.17.4-win-x64"
```

Set dev terminal settings (java, maven)

```
$env:Path = "C:\Windows;C:\WINDOWS;C:\WINDOWS\system32;C:\Windows\system32;C:\Windows\System32\Wbem;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\OpenSSH\;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\Program Files\Dell\DW WLAN Card;C:\Program Files\WIDCOMM\Bluetooth Software\;C:\Program Files\WIDCOMM\Bluetooth Software\syswow64;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\Program Files (x86)\Intel\Intel(R) Management Engine Components\DAL;C:\Program Files\Intel\Intel(R) Management Engine Components\DAL;C:\ProgramData\chocolatey\bin;C:\Program Files\dotnet\;C:\Program Files\Docker\Docker\resources\bin;C:\_dev\git\cmd;C:\ProgramData\DockerDesktop\version-bin;C:\Users\webnl\AppData\Local\Microsoft\WindowsApps;C:\Users\webnl\AppData\Local\Programs\Microsoft VS Code\bin;C:\Users\webnl\AppData\Local\nvs\";
$Env:JAVA_HOME = "C:\_dev\Java\openJDK-12"; $env:Path += ";C:\_dev\Java\openJDK-12\bin";
$Env:MAVEN_HOME = "C:\_dev\maven\apache-maven-3.8.1"; $env:Path += ";C:\_dev\maven\apache-maven-3.8.1\bin";


PS> java -version
openjdk version "12" 2019-03-19
OpenJDK Runtime Environment (build 12+33)
OpenJDK 64-Bit Server VM (build 12+33, mixed mode, sharing)

PS> mvn -v
Apache Maven 3.8.1 (05c21c65bdfed0f71a2f2ada8b84da59348c4c5d)
Maven home: C:\_dev\maven\apache-maven-3.8.1\bin\..
Java version: 12, vendor: Oracle Corporation, runtime: C:\_dev\Java\openJDK-12
Default locale: en_AU, platform encoding: Cp1252
OS name: "windows 10", version: "10.0", arch: "amd64", family: "windows"
```

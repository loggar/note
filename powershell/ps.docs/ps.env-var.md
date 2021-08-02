# powershell env variables

NODE_ENV

```
$Env:NODE_ENV = 'production'

$Env:NODE_ENV = 'production'; node app.js
```

JAVA_HOME

```powershell
> $Env:JAVA_HOME = 'C:\_dev\Java\ms-jdk-16.0.1+9'

> echo $env:JAVA_HOME
> Get-ChildItem Env:JAVA_HOME

```

NODE PATH (append)

```
$env:Path += ";C:\_dev\nodejs\node-v14.17.4-win-x64"
```

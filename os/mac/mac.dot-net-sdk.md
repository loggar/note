# MacOS

## .NET SDK

Homebrew:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

.NET SDK:

```sh
brew install --cask dotnet-sdk
```

Verify Installation:

```sh
dotnet --version
```

Create a New .NET Project:

```sh
mkdir MyDotNetApp
cd MyDotNetApp

dotnet new console
dotnet run
```

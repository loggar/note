# About Execution Policies

## Get Your Execution Policy

```
Get-ExecutionPolicy
Unrestricted



Get-ExecutionPolicy -List

        Scope ExecutionPolicy
        ----- ---------------
MachinePolicy       Undefined
   UserPolicy       Undefined
      Process       Undefined
  CurrentUser       Undefined
 LocalMachine    Unrestricted
```

## Change Your Execution Policy

To change your execution policy:

```
Set-ExecutionPolicy -ExecutionPolicy <PolicyName>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
```

To set the execution policy in a particular scope:

```
Set-ExecutionPolicy -ExecutionPolicy <PolicyName> -Scope <scope>

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

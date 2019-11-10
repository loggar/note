# powershell

## Server Requests

Marking Server Requests `curl` `wget`

```
Invoke-WebRequest
      [-UseBasicParsing]
      [-Uri] <Uri>

curl "http://localhost:8080/api/users"
```

```
 $Body = @{
>>     name = 'alice'
>>     lastName = 'jones'
>> }

curl "http://localhost:8080/api/users" -Method "POST" -Body $Body
```
Get-Content -Path 'C:\services.txt'

Get-Content -Path 'C:\services.txt' | Get-Service

Get-Content -Path 'C:\services.txt' | Get-Service | Start-Service

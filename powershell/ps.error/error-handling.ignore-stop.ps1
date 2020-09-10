Get-Process -Name notepad -ErrorAction Ignore
'Error Ignored'
'Do something else'

Get-Process -Name notepad -ErrorAction Stop
'Not reached'
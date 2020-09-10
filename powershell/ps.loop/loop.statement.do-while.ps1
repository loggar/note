do {
  Write-Host "We're waiting on notepad to stop..."
  Start-Sleep -Seconds 1
} while (Get-Process -Name notepad -ErrorAction Ignore)
while (Get-Process -Name notepad -ErrorAction Ignore) {
  Write-Host "We're waiting on notepad to stop..."
  Start-Sleep -Seconds 1
}
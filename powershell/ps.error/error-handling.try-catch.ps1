try {
  $process = Get-Process -Name notepad -ErrorAction Stop
  $process | Stop-Process
}
catch {
  Write-Host "The notepad process was not started."
}
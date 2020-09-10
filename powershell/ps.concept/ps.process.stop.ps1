$process = Get-Process -Name notepad
if ($process) {
  $process | Stop-Process
}
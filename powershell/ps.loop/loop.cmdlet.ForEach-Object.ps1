Get-ChildItem -Path 'C:\Files' -File -Filter '*.txt' | ForEach-Object {
  Get-Content -Path $_.FullName
}
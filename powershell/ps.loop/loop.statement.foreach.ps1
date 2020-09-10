$files = Get-ChildItem -Path 'C:\Files' -File -Filter '*.txt'
foreach ($file in $files) {
  Get-Content -Path $file.FullName
}
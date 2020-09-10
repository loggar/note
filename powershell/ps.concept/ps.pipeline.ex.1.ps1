<# No pipeline #>
Stop-Service -DisplayName 'Windows Update'

<# No pipeline, passing parameter #>
Stop-Service -InputObject (Get-Service -DisplayName 'Windows Update')

<# Using pipeline #>
Get-Service -DisplayName 'Windows Update' | Stop-Service
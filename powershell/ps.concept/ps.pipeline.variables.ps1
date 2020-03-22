$objinstance = Get-process -Name powershell

$objinstance
$objinstance.Name
$objinstance.GetType()


$objinstance | Get-Member

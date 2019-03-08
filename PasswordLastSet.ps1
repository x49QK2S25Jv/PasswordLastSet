#Show accounts where password was last set more than 365 days ago
Clear-Host
$UserSetDate = Read-Host -Prompt 'How many days back would you like to search?'
$CurrentDate = Get-Date -Format g
$EnteredDate = (Get-Date).AddDays(-$UserSetDate).ToString("dd/MM/yyyy")
Write-Host "The below account/s have a password which has been set more than $UserSetDate days ago" -ForegroundColor Green
Get-ADUser -Filter {PasswordLastSet -lt $EnteredDate} -Properties * | Select-Object Name, PasswordLastSet
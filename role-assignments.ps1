# role-assignments.ps1
Import-Module ActiveDirectory

$users = Import-Csv -Path "users.csv"

foreach ($user in $users) {
    Set-ADUser -Identity $user.Username -Description $user.Role
    Write-Host "Role $($user.Role) assigned to user $($user.Username)."
}

# user-provisioning.ps1
Import-Module ActiveDirectory

$users = Import-Csv -Path "users.csv"

foreach ($user in $users) {
    New-ADUser -Name "$($user.FirstName) $($user.LastName)" `
               -GivenName $user.FirstName `
               -Surname $user.LastName `
               -SamAccountName $user.Username `
               -UserPrincipalName "$($user.Username)@example.com" `
               -EmailAddress $user.Email `
               -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
               -Enabled $true
    Write-Host "User $($user.Username) created successfully."
}

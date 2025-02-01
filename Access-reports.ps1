# access-reports.ps1
Import-Module ActiveDirectory

$users = Get-ADUser -Filter * -SearchBase "OU=Users,DC=example,DC=com" -Properties MemberOf, Description

$report = @()
foreach ($user in $users) {
    $groups = $user.MemberOf | ForEach-Object { (Get-ADGroup $_).Name }
    $report += [PSCustomObject]@{
        UserName = $user.SamAccountName
        Role     = $user.Description
        Groups   = $groups -join ", "
    }
}

$report | Export-Csv -Path "UserAccessReport.csv" -NoTypeInformation
Write-Host "User access report generated successfully."

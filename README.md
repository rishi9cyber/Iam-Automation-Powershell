# IAM Automation with PowerShell

## Overview
This project demonstrates the use of **PowerShell scripts** to automate **Identity and Access Management (IAM)** tasks, such as user provisioning, role assignments, and access management. It showcases how automation can improve efficiency and security in managing user access.

## Key Features
- **User Provisioning**: Automate the creation of user accounts in Active Directory.
- **Role Assignments**: Assign roles to users based on their job functions.
- **Access Management**: Generate reports on user access permissions.

## Use Cases
- Enterprise environments requiring efficient user management.
- Organizations looking to enforce role-based access control (RBAC).
- Compliance with security standards like GDPR and HIPAA.

## Technologies Used
- **PowerShell**: For scripting and automation.
- **Active Directory (AD)**: For user and role management.
- **CSV Files**: For storing user data and role assignments.

## How It Works
1. The PowerShell scripts read user data from a CSV file.
2. User accounts are created in Active Directory.
3. Roles are assigned to users based on predefined rules.
4. Access reports are generated for auditing purposes.

## Code Examples

### PowerShell Script for User Provisioning
```powershell
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

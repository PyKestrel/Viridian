<#
.SYNOPSIS
Disables the Windows Find My Device feature.

.DESCRIPTION
This script disables the Windows Find My Device feature by modifying the registry settings.

.PARAMETER None

.EXAMPLE
Disable-WindowsFindMyDevice.ps1
This example disables the Windows Find My Device feature.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FindMyDevice" -Name "AllowFindMyDevice" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\FindMyDevice" -Name "LocationSyncEnabled" -Value 0 -PropertyType DWORD -Force
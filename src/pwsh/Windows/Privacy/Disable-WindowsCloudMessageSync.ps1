<#
.SYNOPSIS
Disables Windows Cloud Message Sync.

.DESCRIPTION
This script disables the Windows Cloud Message Sync feature by setting the "AllowMessageSync" registry value to 0 under the "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" registry path.

.PARAMETER None

.EXAMPLE
Disable-WindowsCloudMessageSync.ps1
This example disables Windows Cloud Message Sync.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Messaging" -Name "AllowMessageSync" -Value 0 -PropertyType DWORD -Force
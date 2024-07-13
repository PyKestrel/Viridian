<#
.SYNOPSIS
This script disables the Windows Key Management Service (KMS).

.DESCRIPTION
The Disable-WindowsKMS.ps1 script is used to disable the Windows Key Management Service (KMS) on a Windows system. KMS is a licensing service that is used to activate Microsoft products on a network. This script can be used to disable KMS if it is causing issues or if it is no longer needed.

.EXAMPLE
Disable-WindowsKMS.ps1
This example shows how to run the script to disable the Windows KMS.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\CurrentVersion\Software Protection Platform" -Name "NoGenTicket" -Value 1 -PropertyType DWORD -Force
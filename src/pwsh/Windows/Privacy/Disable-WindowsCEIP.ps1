<#
.SYNOPSIS
Disables Windows Customer Experience Improvement Program (CEIP) settings.

.DESCRIPTION
This script disables the Windows Customer Experience Improvement Program (CEIP) settings by modifying the registry.

.PARAMETER None

.EXAMPLE
Disable-WindowsCEIP.ps1
This example runs the script to disable the CEIP settings.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\AppV\CEIP" -Name "CEIPEnable" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\SQMClient\Windows" -Name "CEIPEnable" -Value 0 -PropertyType DWORD -Force
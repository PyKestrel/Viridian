<#
.SYNOPSIS
Disables the Windows Activity Feed.

.DESCRIPTION
This script disables the Windows Activity Feed by creating a new registry key with the value "0" under the path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\System".

.PARAMETER None

.EXAMPLE
Disable-WindowsActivityFeed.ps1
This example runs the script to disable the Windows Activity Feed.
#>

# Elevate To Admin Priviledges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}
New-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Value "0" -PropertyType DWORD -Force

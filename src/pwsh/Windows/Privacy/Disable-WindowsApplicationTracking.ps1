<#
.SYNOPSIS
Disables app launch tracking by modifying the Windows Registry.

.DESCRIPTION
This script disables app launch tracking by modifying the "Start_TrackProgs" value in the Windows Registry. It checks if the current user is an administrator and, if not, restarts the script with administrator privileges. After that, it creates a new registry property with the specified value to disable app launch tracking.

.PARAMETER None

.EXAMPLE
Disable-WindowsApplicationTracking.ps1
This example runs the script to disable app launch tracking.
#>

# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}

# Disable app launch tracking by modifying the Windows Registry
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Start_TrackProgs" -Value 0 -PropertyType DWORD -Force

<#
.SYNOPSIS
Disables Windows experimentation by modifying the registry.

.DESCRIPTION
This script disables Windows experimentation by modifying the registry. It checks if the current user is an administrator and, if not, restarts the script with administrator privileges. Then, it creates a new registry item with a value of 0 under the specified registry path.

.PARAMETER None

.EXAMPLE
Disable-WindowsExperimentation.ps1
This example runs the script to disable Windows experimentation.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" -Name "Value" -Value 0 -PropertyType DWORD -Force
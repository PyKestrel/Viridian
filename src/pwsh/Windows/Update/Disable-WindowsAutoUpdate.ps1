<#
.DESCRIPTION
    This PowerShell script is designed to disable automatic updates in Windows.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    # Exit the current script execution
    exit;
}
# Define the registry path where auto update settings are stored
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
# Define the name of the registry key to disable auto updates
$registryName = "NoAutoUpdate"
# Define the value to disable auto updates (1 = disabled)
$registryValue = 1
# Create or update the registry property to disable auto updates
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force
<#
.DESCRIPTION
    This script disables Bluetooth advertising by modifying the Windows Registry.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
# Disable Bluetooth advertising
$registryPath = "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth"
$registryName = "AllowAdvertising"
$registryValue = 0
# Set the registry value to disable Bluetooth advertising
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force
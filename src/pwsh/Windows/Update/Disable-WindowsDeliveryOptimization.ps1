<#
.DESCRIPTION
    This script disables Windows Delivery Optimization by modifying the Windows Registry.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    # Exit the current script execution
    exit;
}
# Disable Windows Delivery Optimization
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DeliveryOptimization"
$registryName = "DODownloadMode"
$registryValue = 0
# Set the registry value to disable Windows Delivery Optimization
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force
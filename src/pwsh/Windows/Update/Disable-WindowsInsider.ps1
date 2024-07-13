<#
.DESCRIPTION
    This script disables Windows Insider by modifying the Windows Registry.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
# Disable Windows Insider
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsInsider"
$registryName = "AllowBuildPreview"
$registryValue = 0
# Set the registry value to disable Windows Insider
New-ItemProperty -Path $registryPath -Name $registryName -Value $registryValue -PropertyType DWORD -Force
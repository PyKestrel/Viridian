<#
.SYNOPSIS
Disables Windows Online Speech Recognition.

.DESCRIPTION
This script disables Windows Online Speech Recognition by modifying the registry settings.

.PARAMETER None

.EXAMPLE
Disable-WindowsOnlineSpeechRecognition.ps1

.NOTES
This script requires administrative privileges to modify the registry settings.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
# Disable Windows Online Speech Recognition by modifying the registry settings
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -Name "HasAccepted" -Value 0 -PropertyType DWORD -Force
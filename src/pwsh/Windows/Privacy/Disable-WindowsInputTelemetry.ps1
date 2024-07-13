<#
.SYNOPSIS
    Disables Windows input telemetry and data collection.

.DESCRIPTION
    This script disables various Windows input telemetry and data collection settings by modifying the Windows Registry.

.PARAMETER None

.EXAMPLE
    Disable-WindowsInputTelemetry.ps1
    - Disables Windows input telemetry and data collection.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
# Disable Windows input telemetry and data collection settings by modifying the Windows Registry
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" -Name "HarvestContacts" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\TabletPC" -Name "PreventHandwritingDataSharing" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\HandwritingErrorReports" -Name "PreventHandwritingErrorReports" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\Settings" -Name "InsightsEnabled" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Input\TIPC" -Name "Enabled" -Value 0 -PropertyType DWORD -Force
<#
.SYNOPSIS
Disables Windows MSRT (Malicious Software Removal Tool) telemetry.

.DESCRIPTION
This script disables telemetry related to the Windows Malicious Software Removal Tool (MSRT). It creates or modifies registry keys to prevent the reporting of infection information and tracking of heartbeat.

.PARAMETER None

.EXAMPLE
Disable-WindowsMSRTTelemetry.ps1
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\MRT" -Name "DontReportInfectionInformation" -Value 1 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\RemovalTools\MpGears" -Name "HeartbeatTrackingIndex" -Value 0 -PropertyType DWORD -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\RemovalTools\MpGears" -Name "SpyNetReportingLocation" -Value "" -PropertyType MultiString -Force
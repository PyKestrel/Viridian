<#
.SYNOPSIS
Disables Windows diagnostic tracing.

.DESCRIPTION
This script disables diagnostic tracing in the Windows registry.

.PARAMETER None

.EXAMPLE
Disable-WindowsDiagnosticTracing.ps1
This example runs the script to disable Windows diagnostic tracing.
#>
# Check if the current user is not an administrator
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    # If not an administrator, restart the script with administrator privileges
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""; 
    # Exit the current script execution
    exit;
}
New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Diagnostics\Performance" -Name "DisableDiagnosticTracing" -Value 1 -PropertyType DWORD -Force
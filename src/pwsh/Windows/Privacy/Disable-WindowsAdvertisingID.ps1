<#
.DESCRIPTION
    The script disables the Windows Advertising ID feature by modifying the Windows Registry.
#>

# Elevate To Admin Priviledges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# The first command sets the 'Enabled' property to 0 under the 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' path, effectively turning off the Advertising ID for the current user.
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name "Enabled" -Value "0" -PropertyType DWORD -Force

# The second command sets the 'DisabledByGroupPolicy' property to 1 under the 'HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo' path, enforcing the disablement through Group Policy for all users.
IF (!(Test-Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo")) {
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo" -Force | Out-Null
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value "1" `
        -PropertyType DWORD -Force | Out-Null
}
ELSE {
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AdvertisingInfo" -Name "DisabledByGroupPolicy" -Value "1" `
        -PropertyType DWORD -Force | Out-Null
}

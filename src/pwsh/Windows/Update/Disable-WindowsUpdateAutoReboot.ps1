<#
.DESCRIPTION
    The script disables the Windows Update auto-reboot feature by modifying the Windows Registry.
.AUTHOR
    PyKestrel
#>

# The Code Below Is Used To Elevate The Script To Admin Privileges
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

# The command below sets the 'AUPowerManagement' property to 0 under the 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' path, disabling the power management feature for Windows Update.
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "AUPowerManagement" -Value "0" -PropertyType DWORD -Force

# The command below sets the 'NoAutoRebootWithLoggedOnUsers' property to 1 under the 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate' path, preventing Windows from automatically rebooting the system after installing updates when a user is logged in.
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "NoAutoRebootWithLoggedOnUsers" -Value "1" -PropertyType DWORD -Force
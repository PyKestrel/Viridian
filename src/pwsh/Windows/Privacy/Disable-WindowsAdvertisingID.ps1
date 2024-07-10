<#
.DESCRIPTION
    The script disables the Windows Advertising ID feature by modifying the Windows Registry.
#>

# The first command sets the 'Enabled' property to 0 under the 'HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo' path, effectively turning off the Advertising ID for the current user.
Set-ItemProperty -Path HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo -Name Enabled -Value 0 -Force

# The second command sets the 'DisabledByGroupPolicy' property to 1 under the 'HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo' path, enforcing the disablement through Group Policy for all users.
Set-ItemProperty -Path HKLM\Software\Policies\Microsoft\Windows\AdvertisingInfo -Name DisabledByGroupPolicy -Value 1 -Force



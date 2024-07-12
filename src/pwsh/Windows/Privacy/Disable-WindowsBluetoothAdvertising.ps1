Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Bluetooth -Name AllowAdvertising -Value 0 -Force

<#
.DESCRIPTION
    This prevents your device from being discoverable by other Bluetooth devices in range.
#>



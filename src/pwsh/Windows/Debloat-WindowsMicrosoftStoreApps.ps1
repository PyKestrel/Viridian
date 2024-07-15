# Get a list of all installed Microsoft Store apps That Dont include .NET, UI.Xaml, VCLibs, WindowsAppRuntime, or DirectX
$apps = Get-AppxPackage -Publisher "CN=Microsoft Corporation, O=Microsoft Corporation, L=Redmond, S=Washington, C=US" | Where-Object { $_.Name -notmatch "(\.NET|UI\.Xaml|VCLibs|WindowsAppRuntime|DirectX)" }

# Uninstall each app
foreach ($app in $apps) {
    Write-Host "Uninstalling $($app.Name)..."
    Remove-AppxPackage -Package $app.PackageFullName
}

Write-Host "All Microsoft Store apps have been uninstalled."